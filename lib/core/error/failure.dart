
///
///
/// [Failure] interface
///
/// Each failure class must implement this interface
///
/// Sub-classes:
///   a- [ServerFailure]
///
abstract class Failure {
  String? msg;

  Failure({ this.msg});
}

///
/// The [ServerFailure] class is responsible for presenting the errors caused by remote data sources error
/// which holds [errorCode] inside it
///
/// [ServerFailure] extends [Failure] interface
///
/// [ServerFailure] is returned from the repositories after catching the [ServerFailure] thrown by the remote data sources

// code => 501 | 502  // need to update the application from store
class NeedToUpdateApplicationFailure extends Failure {
  final String errorMsg;

  NeedToUpdateApplicationFailure({  required this.errorMsg}) : super(msg: errorMsg);
}

// code => 503  // need to update backend
class NeedToUpdateBackendFailure extends Failure {
  final String? errorMsg;

  NeedToUpdateBackendFailure({ this.errorMsg}) : super(msg: errorMsg);
}
class GeneralFailure extends Failure {
  final String? errorMsg;

  GeneralFailure({ this.errorMsg}) : super(msg: errorMsg);
}

// code => 500
class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure({ super.msg});
}

// code => 400
class BadRequestFailure extends Failure {
  BadRequestFailure({  super.msg});
}

// code => 401
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({  super.msg});
}

// code => 404
class NotFoundFailure extends Failure {
  NotFoundFailure({ super.msg});
}

// code 405
class MethodNotAllowedFailure extends Failure {
  MethodNotAllowedFailure({ super.msg});
}

// code 408
class ConnectionTimeoutFailure extends Failure {
  ConnectionTimeoutFailure({ super.msg});
}

// socketFailure
class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure({super.msg});
}

// HttpFailure
class MyHttpFailure extends Failure {
  MyHttpFailure({  super.msg});
}

// FormatFailure
class MyFormatFailure extends Failure {
  MyFormatFailure({  super.msg});
}

class UnknownFailure extends Failure {
  UnknownFailure({  super.msg});
}