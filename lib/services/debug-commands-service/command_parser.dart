import 'package:dartz/dartz.dart';
import 'package:unwind_app/services/debug-commands-service/command_failure.dart';
import 'package:unwind_app/services/debug-commands-service/command_model.dart';
import 'package:unwind_app/services/debug-commands-service/command_monad.dart';
import 'package:unwind_app/services/debug-commands-service/commands/do_workout_command.dart';
import 'package:unwind_app/services/debug-commands-service/commands/give_command.dart';
import 'package:unwind_app/services/debug-commands-service/utils.dart';

List<String> COMMANDS = [
  '/give',
  '/do',
];

Future<CommandMonad> executeTextCommand(String commandString) async {
  final result = await parseCommandString(COMMANDS)(commandString)
      .bindAsync(dispatchCommand);
  return result.fold(
    (l) => CommandMonad(command: Left(l), message: l.message),
    (r) => r,
  );
}

Either<Failure, CommandModel> Function(String?) parseCommandString(
        List<String> COMMANDS) =>
    (String? commandString) {
      if (commandString == null ||
          commandString.isEmpty ||
          commandString[0] != '/') {
        return Left(CommandFailure('command must start with /', commandString));
      }
      final commandParts = commandString.split(' ');
      if (commandParts.isEmpty) {
        return Left(CommandFailure(
            '$commandString is not valid command', commandString));
      }
      final command = commandParts[0];
      if (!COMMANDS.contains(command)) {
        return Left(CommandFailure('$command is not a command', commandString));
      }

      if (commandParts.length < 2) {
        return Left(
            CommandFailure('command must have arguments ', commandString));
      }

      final arguments = commandParts.sublist(1);
      return Right(CommandModel(command, arguments));
    };

Future<Either<Failure, CommandMonad>> dispatchCommand(
    CommandModel commandModel) async {
  final command = commandModel.command;
  switch (command) {
    case '/give':
      final result = await giveCommand(commandModel);
      return result;
    case '/do':
      return await doWorkoutCommand(commandModel);
    default:
      return Left(CommandFailure('command not found', commandModel.command));
  }
}
