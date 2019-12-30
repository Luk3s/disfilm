abstract class Failure {
  const Failure([this.message]);

  final String message;

  @override
  String toString() {
    if (message == null || message.isEmpty) {
      return "$runtimeType";
    }

    return "$runtimeType: $message";
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message]) : super(message);
}

class ApiFailure extends Failure {
  const ApiFailure([String message]) : super(message);
}
