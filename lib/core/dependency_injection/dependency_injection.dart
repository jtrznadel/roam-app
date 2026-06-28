import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:roam/core/network/dio_factory.dart';
import 'package:roam/core/router/app_router.dart';
import 'package:roam/features/auth/auth_injection.dart';

final sl = GetIt.instance;

Future<void> initDependencyInjections() async {
  sl.registerLazySingleton<Dio>(DioFactory.create);

  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  await initAuthInjection();

  sl.registerLazySingleton(() => AppRouter(authSessionCubit: sl()));
}
