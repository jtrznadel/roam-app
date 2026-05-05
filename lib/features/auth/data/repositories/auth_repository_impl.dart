import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/error/handle_api_call.dart';
import 'package:roam/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:roam/features/auth/domain/entities/auth_tokens_entity.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  const AuthRepositoryImpl({required AuthRemoteDatasource authRemoteDatasource})
    : _authRemoteDatasource = authRemoteDatasource;

  @override
  Future<Either<Failure, Unit>> requestEmailOtp({required String email}) async {
    final result = await handleApiCall(
      () => _authRemoteDatasource.requestEmailOtp(email: email),
    );

    return result.map((_) => unit);
  }

  @override
  Future<Either<Failure, AuthTokensEntity>> verifyEmailOtp({
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

    return response.map((tokensResponse) => tokensResponse.toEntity());
  }
}
