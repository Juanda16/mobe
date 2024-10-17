abstract class Failure {}

// General failures
class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({required this.message});
}
