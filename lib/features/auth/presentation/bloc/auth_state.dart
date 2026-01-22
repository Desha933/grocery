part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class RegisterAuthSuccess extends AuthState {
  final UserEntity user;
  const RegisterAuthSuccess(this.user);
}

final class RegisterAuthFailure extends AuthState {
  final String errMessage;
  const RegisterAuthFailure(this.errMessage);
}

final class LoginAuthSuccess extends AuthState {
  final UserEntity user;
  const LoginAuthSuccess(this.user);
}

final class LoginAuthFailure extends AuthState {
  final String errMessage;
  const LoginAuthFailure(this.errMessage);
}
