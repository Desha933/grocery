import 'package:fpdart/fpdart.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/core/error/server_exception.dart';
import 'package:grocery/features/home/data/data_source/home_remote_data_sourec.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/domain/repos/home_repos.dart';

class HomeRepoImpl implements HomeRepos {
  final HomeRemoteDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> postProduct({
    required ProductEntity productEntity,
  }) async {
    try {
      final imageUrl = await homeDataSource.upLoadImageProduct(
        imageFile: productEntity.imageFile!,
        product: productEntity,
      );
      final response = await homeDataSource.postProduct(
        productEntity: productEntity.copyWith(image: imageUrl),
      );

      return right(response.map((e) => ProductEntity.fromMap(e)).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final response = await homeDataSource.getAllProducts();

      return right(response.map((e) => ProductEntity.fromMap(e)).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
