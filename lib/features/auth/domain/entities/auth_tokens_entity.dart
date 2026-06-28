import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens_entity.freezed.dart';

@freezed
abstract class AuthTokensEntity with _$AuthTokensEntity {
  const factory AuthTokensEntity({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokensEntity;
}
