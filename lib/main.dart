// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retribusi/presentation/bloc/auth/auth_bloc.dart';
import 'package:retribusi/presentation/pages/home_page.dart';
import 'package:retribusi/presentation/pages/login_page.dart';
import 'core/network/dio_client.dart';
import 'data/datasources/remote/auth_remote_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create Dio instance
    final dio = DioClient.createDio();
    
    // Create AuthRemoteDataSource
    final authRemoteDataSource = AuthRemoteDataSource(dio: dio);
    
    // Create AuthRepository
    final AuthRepository authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
    );

    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: authRepository,
      ),
      child: MaterialApp(
        title: 'Flutter Auth',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}