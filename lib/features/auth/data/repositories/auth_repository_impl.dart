import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/error/handle_api_call.dart';
import 'package:roam/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:roam/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

import '../models/auth_session_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;
  final AuthLocalDatasource _authLocalDatasource;

  const AuthRepositoryImpl({
    required AuthRemoteDatasource authRemoteDatasource,
    required AuthLocalDatasource authLocalDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource,
       _authLocalDatasource = authLocalDatasource;

  @override
  Future<Either<Failure, Unit>> requestEmailOtp({required String email}) async {
    final result = await handleApiCall(
      () => _authRemoteDatasource.requestEmailOtp(email: email),
    );

    return result.map((_) => unit);
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> verifyEmailOtp({
    required String email,
    required String otpCode,
    required String deviceId,
    required String deviceName,
  }) async {
    final response = await handleApiCall(
      () => _authRemoteDatasource.verifyEmailOtp(
        email: email,
        otpCode: otpCode,
        deviceId: deviceId,
        deviceName: deviceName,
      ),
    );

    return response.map((sessionModel) => sessionModel.toEntity());
  }

  @override
  Future<Either<Failure, Unit>> clearSession() async {
    try {
      await _authLocalDatasource.clearSession();
      return const Right(unit);
    } catch (_) {
      return Left(const Failure.generalError());
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity?>> getStoredSession() async {
    try {
      final session = await _authLocalDatasource.getStoredSession();
      return Right(session?.toEntity());
    } catch (_) {
      return Left(const Failure.generalError());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    return clearSession();
  }

  @override
  Future<Either<Failure, Unit>> persistSession({
    required AuthSessionEntity session,
  }) async {
    try {
      await _authLocalDatasource.persistSession(
        AuthSessionModel.fromEntity(session),
      );
      return const Right(unit);
    } catch (_) {
      return Left(const Failure.generalError());
    }
  }

  @override
  Future<Either<Failure, AuthSessionEntity>> refreshSession({
    required String refreshToken,
  }) async {
    return const Left(Failure.generalError(message: 'Not implemented yet.'));
  }
}
