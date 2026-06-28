// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailOtpRequest _$VerifyEmailOtpRequestFromJson(
  Map<String, dynamic> json,
) => VerifyEmailOtpRequest(
  email: json['email'] as String,
  otpCode: json['otpCode'] as String,
  deviceId: json['deviceId'] as String,
  deviceName: json['deviceName'] as String,
);

Map<String, dynamic> _$VerifyEmailOtpRequestToJson(
  VerifyEmailOtpRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'otpCode': instance.otpCode,
  'deviceId': instance.deviceId,
  'deviceName': instance.deviceName,
};
