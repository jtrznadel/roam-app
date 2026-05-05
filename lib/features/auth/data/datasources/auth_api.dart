import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:roam/features/auth/data/models/auth_tokens_response.dart';
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
  Future<AuthTokensResponse> verifyEmailOtp(
    @Body() VerifyEmailOtpRequest verifyEmailOtpRequest,
  );
}
