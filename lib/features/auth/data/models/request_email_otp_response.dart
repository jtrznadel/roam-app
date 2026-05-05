import 'package:json_annotation/json_annotation.dart';

part 'request_email_otp_response.g.dart';

@JsonSerializable()
class RequestEmailOtpResponse {
  final String message;

  const RequestEmailOtpResponse({required this.message});

  factory RequestEmailOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestEmailOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestEmailOtpResponseToJson(this);
}
