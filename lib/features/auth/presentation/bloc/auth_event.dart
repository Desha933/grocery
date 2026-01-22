part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class RegisterUserEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const RegisterUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginUserEvent({required this.email, required this.password});
}
