import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/common/use_case/use_case.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/auth/domain/repos/auth_repo.dart';

class LoginUserUseCase implements UseCase<UserEntity, LoginUserParams> {
  final AuthRepo authRepo;
  const LoginUserUseCase(this.authRepo);

  @override
  Future<Either<Failure, UserEntity>> call(LoginUserParams params) {
    return authRepo.loginUser(email: params.email, password: params.password);
  }
}

class LoginUserParams {
  final String email;
  final String password;
  const LoginUserParams({required this.email, required this.password});
}
