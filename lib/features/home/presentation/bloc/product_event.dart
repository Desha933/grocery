part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class PostProductEvent extends ProductEvent {
  final ProductEntity productEntity;
  PostProductEvent({required this.productEntity});
}

final class GetProductsEvent extends ProductEvent {}
