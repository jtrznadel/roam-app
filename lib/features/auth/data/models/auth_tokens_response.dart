import 'package:json_annotation/json_annotation.dart';
import 'package:roam/features/auth/domain/entities/auth_tokens_entity.dart';

part 'auth_tokens_response.g.dart';

@JsonSerializable()
class AuthTokensResponse {
  final String accessToken;
  final String refreshToken;

  const AuthTokensResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokensResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokensResponseToJson(this);

  AuthTokensEntity toEntity() {
    return AuthTokensEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
