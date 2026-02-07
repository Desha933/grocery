part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

// post products states
final class PostProductLoading extends ProductState {}

final class PostProductsuccess extends ProductState {
  final List<ProductEntity> products;
  PostProductsuccess({required this.products});
}

final class PostProductFailure extends ProductState {
  final String errMessage;
  PostProductFailure({required this.errMessage});
}
// get all products states

final class GetAllProductsLoading extends ProductState {}

final class GetAllProductsSuccess extends ProductState {
  final List<ProductEntity> products;
  GetAllProductsSuccess({required this.products});
}

final class GetAllProductsFailure extends ProductState {
  final String errMessage;
  GetAllProductsFailure({required this.errMessage});
}
