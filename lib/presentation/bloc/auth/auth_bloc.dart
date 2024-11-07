// lib/presentation/bloc/auth/auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/auth/login_usecase.dart';
import '../../../domain/usecases/auth/get_current_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthGetCurrentUser>(_onGetCurrentUser);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase(
        LoginParams(email: event.email, password: event.password),
      );
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (userData) => emit(AuthAuthenticated(userData)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onGetCurrentUser(
    AuthGetCurrentUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final result = await getCurrentUserUseCase(NoParams());
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (userData) => emit(AuthAuthenticated(userData)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}