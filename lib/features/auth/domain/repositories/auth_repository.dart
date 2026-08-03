import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Unit>> requestEmailOtp({required String email});

  Future<Either<Failure, AuthSessionEntity>> verifyEmailOtp({
    required String email,
    required String otpCode,
    required String deviceId,
    required String deviceName,
  });

  Future<Either<Failure, AuthSessionEntity?>> getStoredSession();

  Future<Either<Failure, Unit>> persistSession({
    required AuthSessionEntity session,
  });

  Future<Either<Failure, AuthSessionEntity>> refreshSession({
    required String refreshToken,
  });

  Future<Either<Failure, Unit>> clearSession();

  Future<Either<Failure, Unit>> logout({required String refreshToken});
}
