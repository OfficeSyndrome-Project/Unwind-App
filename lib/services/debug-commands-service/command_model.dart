class CommandModel {
  final String command;
  final List<String> arguments;

  CommandModel(this.command, this.arguments);

  @override
  String toString() => 'CommandModel{command: $command, arguments: $arguments}';
}
