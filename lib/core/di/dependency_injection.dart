import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:roam/core/network/dio_factory.dart';
import 'package:roam/core/router/app_router.dart';
import 'package:roam/features/auth/auth_injection.dart';
import 'package:roam/features/auth/presentation/cubit/auth_session_cubit.dart';
import 'package:roam/features/peaks/data/datasources/peak_local_datasource.dart';
import 'package:roam/features/peaks/peaks_injection.dart';

import '../network/auth_interceptor.dart';

final sl = GetIt.instance;

Future<void> initDependencyInjections() async {
  sl.registerLazySingleton<Dio>(DioFactory.create);

  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  await initAuthInjection();
  initPeaksInjection();

  await sl<PeakLocalDatasource>().seedCatalogIfNeeded();

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(
      getStoredSessionUseCase: sl(),
      refreshSessionUseCase: sl(),
      dioProvider: () => sl<Dio>(),
      onSessionExpired: () => sl<AuthSessionCubit>().invalidateSession(),
    ),
  );

  sl<Dio>().interceptors.insert(0, sl<AuthInterceptor>());

  sl.registerLazySingleton(() => AppRouter(authStatusProvider: sl()));
}
