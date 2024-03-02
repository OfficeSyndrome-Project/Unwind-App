abstract class Failure {
  String get message;
}

class DatabaseFailure extends Failure {
  final String message;
  DatabaseFailure({required this.message});
}
