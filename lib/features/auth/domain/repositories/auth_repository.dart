import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/features/auth/domain/entities/auth_tokens_entity.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Unit>> requestEmailOtp({required String email});

  Future<Either<Failure, AuthTokensEntity>> verifyEmailOtp({
    required String email,
    required String otpCode,
    required String deviceId,
    required String deviceName,
  });
}
