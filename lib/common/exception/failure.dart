class Failure {
  Failure._();

  factory Failure.maintenace(int errorCode, String msg) = Maintenance;
  factory Failure.internetError() = InternetError;
  factory Failure.timedOutError() = ConnectionTimeout;
  factory Failure.serverError(int errorCode, String msg) = ServerError;
  factory Failure.networkError(String msg) = NetworkError;
  factory Failure.uncatchError(Exception exception) = UnCatchError;
}

class Maintenance extends Failure {
  Maintenance(this.errorCode, this.msg) : super._();

  final int errorCode;
  final String msg;
}

class ServerError extends Failure {
  ServerError(this.errorCode, this.msg) : super._();

  final int errorCode;
  final String msg;
}
class NetworkError extends Failure {
  NetworkError(this.msg) : super._();

  final String msg;
}

class UnCatchError extends Failure {
  UnCatchError(this.exception) : super._();

  final Exception exception;
}

class InternetError extends Failure {
  InternetError() : super._();
}

class ConnectionTimeout extends Failure {
  ConnectionTimeout() : super._();
}

abstract class FeatureFailure extends Failure {
  FeatureFailure() : super._();
}
