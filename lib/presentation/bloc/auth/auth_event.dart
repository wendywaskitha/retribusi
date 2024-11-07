// lib/presentation/bloc/auth/auth_event.dart

import 'package:equatable/equatable.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}