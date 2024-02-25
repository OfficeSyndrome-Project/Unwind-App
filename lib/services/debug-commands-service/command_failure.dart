abstract class Failure {
  String get message;
}

class CommandFailure extends Failure {
  final String message;
  final String? commandString;

  CommandFailure(this.message, this.commandString);

  @override
  String toString() =>
      'CommandFailure{message: $message, commandString: $commandString}';
}
