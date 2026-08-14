import 'package:roam/features/auth/data/datasources/auth_api.dart';
import 'package:roam/features/auth/data/models/auth_session_model.dart';
import 'package:roam/features/auth/data/models/logout_request.dart';
import 'package:roam/features/auth/data/models/refresh_session_request.dart';
import 'package:roam/features/auth/data/models/request_email_otp_request.dart';
import 'package:roam/features/auth/data/models/request_email_otp_response.dart';
import 'package:roam/features/auth/data/models/verify_email_otp_request.dart';

abstract class AuthRemoteDatasource {
  Future<RequestEmailOtpResponse> requestEmailOtp({required String email});

  Future<AuthSessionModel> verifyEmailOtp({
    required String email,
    required String otpCode,
    required String deviceId,
    required String deviceName,
  });

  Future<AuthSessionModel> refreshSession({required String refreshToken});

  Future<void> logout({required String refreshToken});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final AuthApi _authApi;

  const AuthRemoteDatasourceImpl({required this._authApi});

  @override
  Future<RequestEmailOtpResponse> requestEmailOtp({required String email}) {
    return _authApi.requestEmailOtp(RequestEmailOtpRequest(email: email));
  }

  @override
  Future<AuthSessionModel> verifyEmailOtp({
    required String email,
    required String otpCode,
    required String deviceId,
    required String deviceName,
  }) {
    return _authApi.verifyEmailOtp(
      VerifyEmailOtpRequest(
        email: email,
        otpCode: otpCode,
        deviceId: deviceId,
        deviceName: deviceName,
      ),
    );
  }

  @override
  Future<AuthSessionModel> refreshSession({required String refreshToken}) {
    return _authApi.refreshSession(
      RefreshSessionRequest(refreshToken: refreshToken),
    );
  }

  @override
  Future<void> logout({required String refreshToken}) {
    return _authApi.logout(LogoutRequest(refreshToken: refreshToken));
  }
}
