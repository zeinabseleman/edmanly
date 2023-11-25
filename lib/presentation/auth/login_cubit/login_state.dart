part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}



class LoginStateLoading extends LoginInitial {}

class LoginStateLoaded extends LoginInitial {
  final User user;
  LoginStateLoaded(this.user);
}

class LoginStateFailed extends LoginInitial {}

class PhoneLoginLoading extends LoginInitial {}
class PhoneLoginLoaded extends LoginInitial {
  final User user;
  PhoneLoginLoaded(this.user);
}
class PhoneLoginFailed extends LoginInitial {}

class RegisterLoading extends LoginInitial {}
class RegisterLoaded extends LoginInitial {
  final User user;
  RegisterLoaded(this.user);
}
class RegisterFailed extends LoginInitial {}

class GoogleLoginLoading extends LoginInitial {}
class GoogleLoginLoaded extends LoginInitial {
  final User user;
  GoogleLoginLoaded(this.user);
}
class GoogleLoginFailed extends LoginInitial {}

class FacebookLoginLoading extends LoginInitial {}

class FacebookLoginLoaded extends LoginInitial {
  final User user;
  FacebookLoginLoaded(this.user);
}

class FacebookLoginFailed extends LoginInitial {}


class VerifyCodeLoading extends LoginInitial {}

class VerifyCodeLoaded extends LoginInitial {}

class VerifyCodeFailed extends LoginInitial {}


