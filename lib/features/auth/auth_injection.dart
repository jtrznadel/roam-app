import 'package:roam/core/dependency_injection/dependency_injection.dart';
import 'package:roam/features/auth/data/datasources/auth_api.dart';
import 'package:roam/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:roam/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';
import 'package:roam/features/auth/domain/usecases/request_email_otp_usecase.dart';
import 'package:roam/features/auth/domain/usecases/verify_email_otp_usecase.dart';
import 'package:roam/features/auth/presentation/cubit/login_form_cubit.dart';

Future<void> initAuthInjection() async {
  sl.registerLazySingleton<AuthApi>(() => AuthApi(sl()));

  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(authApi: sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDatasource: sl()),
  );

  sl.registerFactory(() => RequestEmailOtpUseCase(repo: sl()));

  sl.registerFactory(() => VerifyEmailOtpUseCase(repo: sl()));

  sl.registerFactory(
    () => LoginFormCubit(
      requestEmailOtpUseCase: sl(),
      verifyEmailOtpUseCase: sl(),
    ),
  );
}
