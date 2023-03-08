part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class PasswordIsVisiableChange extends AuthState {}
class IsTermsChecked extends AuthState {}


class SignUpLoading extends AuthState {}
class SignUpSuccess extends AuthState {}
class SignUpError extends AuthState {
  String err;
  SignUpError(this.err);
}

class LogInLoading extends AuthState {}
class LogInSuccess extends AuthState {}
class LogInError extends AuthState {
  String err;
  LogInError(this.err);
}
