import 'package:grocery/core/error/server_exception.dart';
import 'package:grocery/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginUser({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  SupabaseClient supabase;
  AuthRemoteDataSourceImpl(this.supabase);
  @override
  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final respnse = await supabase.auth.signUp(
        data: {'name': name},
        email: email,
        password: password,
      );
      if (respnse.user == null) {
        throw ServerException('User not found');
      }
      return UserModel.fromJson(respnse.user!.toJson());
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw ServerException('User not found');
      }

      return UserModel(
        id: response.user!.id,
        name: response.user!.userMetadata?['name'] ?? "NO Name",
        email: email,
        password: password,
      );
    } on Exception catch (e) {
      throw ServerException(e.toString());
    }
  }
}
