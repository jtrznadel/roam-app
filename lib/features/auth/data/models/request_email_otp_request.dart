import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_email_otp_request.g.dart';

@JsonSerializable()
class RequestEmailOtpRequest {
  final String email;

  RequestEmailOtpRequest({required this.email});

  factory RequestEmailOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestEmailOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestEmailOtpRequestToJson(this);
}
