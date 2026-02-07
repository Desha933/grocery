import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/domain/use_case/get_all_products_use_case.dart';
import 'package:grocery/features/home/domain/use_case/post_product_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final PostProductUseCase _postProductUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  ProductBloc({
    required PostProductUseCase postProductUseCase,
    required GetAllProductsUseCase getAllProductsUseCase,
  }) : _postProductUseCase = postProductUseCase,
       _getAllProductsUseCase = getAllProductsUseCase,
       super(GetAllProductsLoading()) {
    on<PostProductEvent>(_onPostProduct);
    on<GetProductsEvent>(_onGetAllProducts);
  }

  FutureOr<void> _onGetAllProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(GetAllProductsLoading());
    final result = await _getAllProductsUseCase(NoParams());
    result.fold(
      (failure) =>
          emit(GetAllProductsFailure(errMessage: failure.errorMessage)),
      (products) => emit(GetAllProductsSuccess(products: products)),
    );
  }

  FutureOr<void> _onPostProduct(
    PostProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(PostProductLoading());
    final result = await _postProductUseCase(event.productEntity);
    result.fold(
      (failure) => emit(PostProductFailure(errMessage: failure.errorMessage)),
      (products) => emit(PostProductsuccess(products: products)),
    );
  }
}
