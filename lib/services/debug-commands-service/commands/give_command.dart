import 'package:dartz/dartz.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/services/debug-commands-service/command_failure.dart';
import 'package:unwind_app/services/debug-commands-service/command_model.dart';
import 'package:unwind_app/services/debug-commands-service/command_monad.dart';
import 'package:unwind_app/services/debug-commands-service/utils.dart';
import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

Future<Either<Failure, CommandMonad>> giveCommand(
    CommandModel commandModel) async {
  final now = DateTime.now();
  if (commandModel.arguments.length < 2) {
    return Left(failureMessageMaker(
        'give command must have arguments: /give {area} {startDay}',
        commandModel));
  }

  final area = commandModel.arguments[0];
  final days = int.tryParse(commandModel.arguments[1]);
  if (days == null) {
    return Left(failureMessageMaker('days must be a number', commandModel));
  }
  Set<WorkoutlistTitle> areas = {};

  switch (area) {
    case 'all':
      areas = workoutListTitleMap.values.toSet();
      break;
    default:
      final areaCode = workoutListTitleMap[area];
      if (areaCode == null) {
        return Left(failureMessageMaker(
            'area not found, valid workout titles are ${workoutListTitleMap.keys}',
            commandModel));
      }
      areas.add(areaCode);
  }
  final result = await ScreeningDiagnoseService.createWorkouts(
    areas.toList(),
    startingFrom: now.add(Duration(days: days)),
  );
  if (result.length == 0) {
    return Right(CommandMonad(
        command: Right(commandModel),
        message:
            successMessageMaker(commandModel, 'already have "$area" workout')));
  }
  return Right(CommandMonad(
      command: Right(commandModel),
      message: successMessageMaker(commandModel,
          'executed successfully: ${result.length} workouts created for $area starting from ${now.add(Duration(days: days))}')));
}
