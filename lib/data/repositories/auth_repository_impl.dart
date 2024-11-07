// lib/data/repositories/auth_repository_impl.dart

import 'package:dio/dio.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout(String token) async {
    try {
      await _remoteDataSource.logout(token);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}