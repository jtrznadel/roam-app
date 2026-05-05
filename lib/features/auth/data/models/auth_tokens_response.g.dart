// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthTokensResponse _$AuthTokensResponseFromJson(Map<String, dynamic> json) =>
    AuthTokensResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthTokensResponseToJson(AuthTokensResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
