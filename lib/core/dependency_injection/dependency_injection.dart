import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:roam/core/network/dio_factory.dart';
import 'package:roam/features/auth/auth_injection.dart';

final sl = GetIt.instance;

Future<void> initDependencyInjections() async {
  sl.registerLazySingleton<Dio>(DioFactory.create);

  await initAuthInjection();
}
