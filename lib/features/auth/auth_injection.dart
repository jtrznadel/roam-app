import 'package:roam/core/di/dependency_injection.dart';
import 'package:roam/features/auth/data/datasources/auth_api.dart';
import 'package:roam/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:roam/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:roam/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:roam/features/auth/data/services/auth_local_service.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';
import 'package:roam/features/auth/domain/usecases/clear_session_usecase.dart';
import 'package:roam/features/auth/domain/usecases/get_stored_session_usecase.dart';
import 'package:roam/features/auth/domain/usecases/logout_usecase.dart';
import 'package:roam/features/auth/domain/usecases/persist_session_usecase.dart';
import 'package:roam/features/auth/domain/usecases/request_email_otp_usecase.dart';
import 'package:roam/features/auth/domain/usecases/verify_email_otp_usecase.dart';
import 'package:roam/features/auth/presentation/cubit/auth_session_cubit.dart';
import 'package:roam/features/auth/presentation/cubit/login_form_cubit.dart';

import '../../core/router/auth_status_provider.dart';
import 'domain/usecases/refresh_session_usecase.dart';

Future<void> initAuthInjection() async {
  sl.registerLazySingleton<AuthApi>(() => AuthApi(sl()));

  sl.registerLazySingleton<AuthLocalService>(
    () => AuthLocalServiceImpl(storage: sl()),
  );

  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(authLocalService: sl()),
  );

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(authApi: sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDatasource: sl(),
      authLocalDatasource: sl(),
    ),
  );

  sl.registerFactory(() => RequestEmailOtpUseCase(repo: sl()));
  sl.registerFactory(() => VerifyEmailOtpUseCase(repo: sl()));
  sl.registerFactory(() => GetStoredSessionUseCase(repo: sl()));
  sl.registerFactory(() => PersistSessionUseCase(repo: sl()));
  sl.registerFactory(() => ClearSessionUseCase(repo: sl()));
  sl.registerLazySingleton(() => RefreshSessionUseCase(repo: sl()));
  sl.registerFactory(() => LogoutUseCase(repo: sl()));

  sl.registerLazySingleton(
    () => AuthSessionCubit(
      getStoredSessionUseCase: sl(),
      persistSessionUseCase: sl(),
      refreshSessionUseCase: sl(),
      clearSessionUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );

  sl.registerLazySingleton<AuthStatusProvider>(() => sl<AuthSessionCubit>());

  sl.registerFactory(
    () => LoginFormCubit(
      requestEmailOtpUseCase: sl(),
      verifyEmailOtpUseCase: sl(),
    ),
  );
}
