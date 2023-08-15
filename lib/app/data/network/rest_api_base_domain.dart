sealed class BaseDomain {}

class Loading extends BaseDomain {}

class NetworkError extends BaseDomain {}

class ServerError extends BaseDomain {
  final String errorResponse;
  final int errorCode;

  ServerError({this.errorResponse = "", this.errorCode = 0});
}

class Invalid extends BaseDomain {}
