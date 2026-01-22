import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/core/error/server_exception.dart';
import 'package:grocery/features/auth/data/data_soure/auth_remote_data_source.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.registerUser(
        name: name,
        email: email,
        password: password,
      );

      return right(UserEntity(name: response.name!, email: response.email!));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.loginUser(
        email: email,
        password: password,
      );

      return right(UserEntity(name: response.name!, email: response.email!));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
