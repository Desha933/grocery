import 'dart:io';

import 'package:grocery/core/error/server_exception.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<Map<String, dynamic>>> postProduct({
    required ProductEntity productEntity,
  });
  Future<List<Map<String, dynamic>>> getAllProducts();

  Future<String> upLoadImageProduct({
    required File imageFile,
    required ProductEntity product,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient supabaseClient;
  HomeRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<List<Map<String, dynamic>>> postProduct({
    required ProductEntity productEntity,
  }) async {
    try {
      final response = await supabaseClient
          .from("products")
          .insert(productEntity.toMap())
          .select();
      if (response.isEmpty) {
        throw ServerException("Product not added");
      }
      return response;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> upLoadImageProduct({
    required File imageFile,
    required ProductEntity product,
  }) async {
    try {
      await supabaseClient.storage
          .from("product_image")
          .upload(product.id, imageFile);

      final url = supabaseClient.storage
          .from("product_image")
          .getPublicUrl(product.id);

      return url;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAllProducts() async {
    try {
      final response = await supabaseClient.from("products").select();

      if (response.isEmpty) {
        throw ServerException("products not found");
      }
      return response;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
