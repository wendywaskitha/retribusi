// lib/domain/usecases/auth/login_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:retribusi/domain/repositories/auth_repository.dart';
import 'package:retribusi/core/error/failures.dart';
import 'package:retribusi/core/usecases/usecase.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

class LoginUseCase implements UseCase<Map<String, dynamic>, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

