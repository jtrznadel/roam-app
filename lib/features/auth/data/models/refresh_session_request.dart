import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_session_request.g.dart';

@JsonSerializable()
class RefreshSessionRequest {
  final String refreshToken;

  const RefreshSessionRequest({required this.refreshToken});

  factory RefreshSessionRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshSessionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshSessionRequestToJson(this);
}
