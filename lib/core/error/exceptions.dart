///
/// [ServerErrorException] implements [Exception] interface
///

// code => 501 | 502  // need to update the application from store
class NeedToUpdateApplicationException implements Exception {}

// code => 503  // need to update backend
class NeedToUpdateBackendException implements Exception {}

// code => 500
class InternalServerErrorException implements Exception {}

// code => 400
class BadRequestException implements Exception {
  String errorMsg = '';

  BadRequestException({required this.errorMsg});
}

// code => 401
class UnauthorizedException implements Exception {
  String errorMsg = '';
  UnauthorizedException({required this.errorMsg});
}

// code => 404
class NotFoundException implements Exception {}

// code 405
class MethodNotAllowedException implements Exception {}

// code 408
class ConnectionTimeoutException implements Exception {}

// connection error
class ConnectionError implements Exception {}

// socketException
class NoInternetConnectionException implements Exception {
  String errorMsg = '';
  NoInternetConnectionException({required this.errorMsg});
}

// HttpException
class MyHttpException implements Exception {}

// cancel request
class CancelRequest implements Exception {}

// FormatException
class MyFormatException implements Exception {}

class UnknownException implements Exception {}
