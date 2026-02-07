import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/domain/repos/home_repos.dart';

class PostProductUseCase {
  final HomeRepos homeRepos;
  PostProductUseCase(this.homeRepos);
  Future<Either<Failure, List<ProductEntity>>> call(
    ProductEntity productEntity,
  ) async {
    if (productEntity.imageFile == null) {
      return left(Failure('Image is required'));
    }
    return await homeRepos.postProduct(productEntity: productEntity);
  }
}
