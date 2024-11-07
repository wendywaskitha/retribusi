// lib/domain/usecases/auth/get_current_user_usecase.dart

import 'package:dartz/dartz.dart';
import '../../repositories/auth_repository.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';

class GetCurrentUserUseCase implements UseCase<Map<String, dynamic>, NoParams> {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}