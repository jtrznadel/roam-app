import 'package:json_annotation/json_annotation.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';

part 'auth_session_model.g.dart';

@JsonSerializable()
class AuthSessionModel {
  final String accessToken;
  final String refreshToken;

  const AuthSessionModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthSessionModelToJson(this);

  factory AuthSessionModel.fromEntity(AuthSessionEntity entity) {
    return AuthSessionModel(
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
    );
  }

  AuthSessionEntity toEntity() {
    return AuthSessionEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
