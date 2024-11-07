// lib/core/network/dio_client.dart

import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api', // For Android emulator
        // Use 'http://localhost:8000/api' for iOS simulator
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  }
}