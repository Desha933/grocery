import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, UserEntity>> registerUser({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> loginUser({
    required String email,
    required String password,
  });
}
