import 'package:json_annotation/json_annotation.dart';

part 'verify_email_otp_request.g.dart';

@JsonSerializable()
class VerifyEmailOtpRequest {
  final String email;
  final String otpCode;
  final String deviceId;
  final String deviceName;

  const VerifyEmailOtpRequest({
    required this.email,
    required this.otpCode,
    required this.deviceId,
    required this.deviceName,
  });

  factory VerifyEmailOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailOtpRequestToJson(this);
}
