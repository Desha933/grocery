import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/common/use_case/use_case.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';

class RegisterUserUseCase implements UseCase<UserEntity, RegisterUserParams> {
  final AuthRepo authRepo;
  const RegisterUserUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterUserParams params) {
    return authRepo.registerUser(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class RegisterUserParams {
  final String name;
  final String email;
  final String password;
  const RegisterUserParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
