import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/usecase/usecase.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class VerifyEmailOtpUseCase
    implements UseCase<AuthSessionEntity, VerifyEmailOtpParams> {
  final AuthRepository _repo;

  const VerifyEmailOtpUseCase({required AuthRepository repo}) : _repo = repo;

  @override
  Future<Either<Failure, AuthSessionEntity>> call(VerifyEmailOtpParams params) {
    return _repo.verifyEmailOtp(
      email: params.email,
      otpCode: params.otpCode,
      deviceId: params.deviceId,
      deviceName: params.deviceName,
    );
  }
}

class VerifyEmailOtpParams {
  final String email;
  final String otpCode;
  final String deviceId;
  final String deviceName;

  const VerifyEmailOtpParams({
    required this.email,
    required this.otpCode,
    required this.deviceId,
    required this.deviceName,
  });
}
