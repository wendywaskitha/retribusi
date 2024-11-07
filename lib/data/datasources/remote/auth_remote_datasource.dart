// lib/data/datasources/remote/auth_remote_datasource.dart

import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Login failed');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? 'Login failed');
      }
      throw Exception('Connection failed: ${e.message}');
    }
  }

  @override
  Future<Map<String, dynamic>> getCurrentUser () async {
    try {
      final response = await dio.get(ApiConstants.user);
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception(response.data['message'] ?? 'Failed to fetch user data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? 'Failed to fetch user data');
      }
      throw Exception('Connection failed: ${e.message}');
    }
  }
}