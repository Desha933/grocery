import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';

abstract interface class HomeRepos {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> postProduct({
    required ProductEntity productEntity,
  });
}
