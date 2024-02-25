import 'package:dartz/dartz.dart';
import 'package:unwind_app/services/debug-commands-service/command_failure.dart';
import 'package:unwind_app/services/debug-commands-service/command_model.dart';

class CommandMonad {
  final Either<Failure, CommandModel> command;
  String? message;

  CommandMonad({
    required this.command,
    this.message,
  });

  bindAsync<R2>(Future<Either<Failure, R2>> Function(CommandModel) f) async {
    return command.fold((l) async => left(l), f);
  }

  bind<R2>(Either<Failure, R2> Function(CommandModel) f) {
    return command.fold((l) => left(l), f);
  }

  @override
  String toString() => 'CommandMonad{command: $command, message: $message}';
}
