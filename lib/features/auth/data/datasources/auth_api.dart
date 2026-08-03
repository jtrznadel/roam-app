import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:roam/features/auth/data/models/auth_session_model.dart';
import 'package:roam/features/auth/data/models/logout_request.dart';
import 'package:roam/features/auth/data/models/refresh_session_request.dart';
import 'package:roam/features/auth/data/models/request_email_otp_request.dart';
import 'package:roam/features/auth/data/models/request_email_otp_response.dart';
import 'package:roam/features/auth/data/models/verify_email_otp_request.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/api/v1/auth/email/otp/request')
  Future<RequestEmailOtpResponse> requestEmailOtp(
    @Body() RequestEmailOtpRequest requestEmailOtpRequest,
  );

  @POST('/api/v1/auth/email/otp/verify')
  Future<AuthSessionModel> verifyEmailOtp(
    @Body() VerifyEmailOtpRequest verifyEmailOtpRequest,
  );

  @POST('/api/v1/auth/token/refresh')
  Future<AuthSessionModel> refreshSession(
    @Body() RefreshSessionRequest refreshSessionRequest,
  );

  @POST('/api/v1/auth/logout')
  Future<void> logout(@Body() LogoutRequest logoutRequest);
}
