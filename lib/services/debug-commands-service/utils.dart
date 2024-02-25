import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:unwind_app/services/debug-commands-service/command_failure.dart';
import 'package:unwind_app/services/debug-commands-service/command_model.dart';

extension EitherAsync<L, R> on Either<L, R> {
  Future<Either<L, R2>> bindAsync<R2>(
      Future<Either<L, R2>> Function(R) f) async {
    return fold((l) async => left(l), f);
  }
}

int Function() Function(int) randomInt(int from) =>
    (int to) => () => from + Random().nextInt(to);

CommandFailure failureMessageMaker(String message, CommandModel commandModel) {
  return CommandFailure(
      message, commandModel.command + ' ' + commandModel.arguments.join(' '));
}

String? successMessageMaker(CommandModel commandModel, String message) {
  return '✅ $message';
}
