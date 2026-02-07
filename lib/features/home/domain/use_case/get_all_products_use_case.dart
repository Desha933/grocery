import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/common/use_case/use_case.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/domain/repos/home_repos.dart';

class GetAllProductsUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final HomeRepos homeRepos;
  GetAllProductsUseCase(this.homeRepos);
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await homeRepos.getAllProducts();
  }
}

class NoParams {
  const NoParams();
}
