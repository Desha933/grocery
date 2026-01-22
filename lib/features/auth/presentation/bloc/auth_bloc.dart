import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/domain/use_case/login_user_use_case.dart';
import 'package:grocery/features/auth/domain/use_case/register_user_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUserUseCase _registerUserUseCase;
  final LoginUserUseCase _loginUserUseCase;

  AuthBloc({
    required RegisterUserUseCase registerUserUseCase,
    required LoginUserUseCase loginUserUseCase,
  }) : _registerUserUseCase = registerUserUseCase,
       _loginUserUseCase = loginUserUseCase,

       super(AuthInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
    on<LoginUserEvent>(_onLoginUser);
  }

  FutureOr<void> _onLoginUser(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _loginUserUseCase.call(
      LoginUserParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(LoginAuthFailure(failure.errorMessage)),
      (user) => emit(LoginAuthSuccess(user)),
    );
  }

  FutureOr<void> _onRegisterUser(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _registerUserUseCase.call(
      RegisterUserParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(RegisterAuthFailure(failure.errorMessage)),
      (user) => emit(RegisterAuthSuccess(user)),
    );
  }
}
