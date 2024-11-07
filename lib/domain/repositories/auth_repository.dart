// lib/domain/repositories/auth_repository.dart

import 'package:dartz/dartz.dart';
import 'package:retribusi/core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(String email, String password);
  Future<Either<Failure, Map<String, dynamic>>> getCurrentUser();
}