import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

// Core
import 'package:retribusi/core/network/network_info.dart';

// Features
import 'package:retribusi/data/datasources/local/auth_local_datasource.dart';
import 'package:retribusi/data/datasources/remote/auth_remote_datasource.dart';
import 'package:retribusi/data/repositories/auth_repository_impl.dart';
import 'package:retribusi/domain/repositories/auth_repository.dart';
import 'package:retribusi/domain/usecases/auth/login_usecase.dart';
import 'package:retribusi/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:retribusi/presentation/bloc/auth/auth_bloc.dart';
import 'package:retribusi/core/constants/api_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      getCurrentUserUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl()),
  );
  
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  
  sl.registerLazySingleton(() => Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    )
  );
  
  sl.registerLazySingleton(() => InternetConnectionChecker());
}