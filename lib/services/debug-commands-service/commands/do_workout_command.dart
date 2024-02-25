import 'package:dartz/dartz.dart';
import 'package:unwind_app/database/workoutlist_db.dart';
import 'package:unwind_app/injection_container.dart';
import 'package:unwind_app/models/workoutlist_model.dart';
import 'package:unwind_app/services/debug-commands-service/command_failure.dart';
import 'package:unwind_app/services/debug-commands-service/command_model.dart';
import 'package:unwind_app/services/debug-commands-service/command_monad.dart';
import 'package:unwind_app/services/debug-commands-service/utils.dart';

Future<Either<Failure, CommandMonad>> doWorkoutCommand(
    CommandModel commandModel) async {
  final now = DateTime.now();
  if (commandModel.arguments.isEmpty) {
    return Left(
        failureMessageMaker('do command must have arguments', commandModel));
  }
  if (commandModel.arguments.length < 3) {
    return Left(failureMessageMaker(
        'do command must have area and start day arguments', commandModel));
  }
  final area = commandModel.arguments[0];
  final areaCode = workoutListTitleMap[area];
  if (areaCode == null) {
    return Left(failureMessageMaker(
        '"$area" area not found, valid workout titles are ${workoutListTitleMap.keys}',
        commandModel));
  }
  final startDay = int.tryParse(commandModel.arguments[1]);
  if (startDay == null) {
    return Left(
        failureMessageMaker('start day must be a number', commandModel));
  }
  final endDay = int.tryParse(commandModel.arguments[2]);
  if (endDay == null) {
    return Left(failureMessageMaker('end day must be a number', commandModel));
  }

  final startDate = now.add(Duration(days: startDay));
  final endDate = now.add(Duration(days: endDay));

  final workoutListDB = serviceLocator<WorkoutListDB>();
  final availableWorkouts = await workoutListDB.getAvailableWorkoutListTitles();
  if (!availableWorkouts.contains(areaCode.name)) {
    return Left(failureMessageMaker(
        'workouts for "$area" are not given, try /give $area 0', commandModel));
  }

  int Function() randomNrsScoreUnderEight = randomInt(0)(8);
  final workouts = await workoutListDB.getWorkoutListByTitle(areaCode.name);
  now.add(Duration(days: startDay));
  final workoutsToUpdate = workouts
      .whereType<WorkoutListModel>()
      .where((element) => element.date!
          .isAfter(DateTime(startDate.year, startDate.month, startDate.day)))
      .where((element) => element.date!
          .isBefore(DateTime(endDate.year, endDate.month, endDate.day + 1)))
      .map((workout) => workout.copyWith(
            remaining_times: randomInt(0)((workout.total_times ?? 1) - 1)(),
            NRS_before: randomNrsScoreUnderEight(),
            NRS_after: randomNrsScoreUnderEight(),
          ))
      .toList();

  await workoutListDB.updateAll(workoutsToUpdate);
  return Right(CommandMonad(
      command: Right(commandModel),
      message: successMessageMaker(commandModel,
          'executed successfully: ${workoutsToUpdate.length} workouts updated for $area from ${DateTime(startDate.year, startDate.month, startDate.day)} to ${DateTime(endDate.year, endDate.month, endDate.day + 1)}')));
}
