import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery/core/common/cubit/app_user_cubit.dart';
import 'package:grocery/core/secrets/app_secrets.dart';
import 'package:grocery/features/auth/data/data_soure/auth_remote_data_source.dart';
import 'package:grocery/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';
import 'package:grocery/features/auth/domain/use_case/login_user_use_case.dart';
import 'package:grocery/features/auth/domain/use_case/register_user_use_case.dart';
import 'package:grocery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );
  serviceLocator.registerLazySingleton<AppUserCubit>(() => AppUserCubit());
  _initAuth();
}

void _initAuth() {
  // data source
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    // repo
    ..registerFactory<AuthRepo>(() => AuthRepoImpl(serviceLocator()))
    // use case
    ..registerFactory<RegisterUserUseCase>(
      () => RegisterUserUseCase(serviceLocator()),
    )
    ..registerFactory<LoginUserUseCase>(
      () => LoginUserUseCase(serviceLocator()),
    )
    // bloc
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        registerUserUseCase: serviceLocator(),
        loginUserUseCase: serviceLocator(),
      ),
    );
}
