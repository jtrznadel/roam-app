import 'package:freezed_annotation/freezed_annotation.dart';

part 'peak.freezed.dart';

@freezed
abstract class Peak with _$Peak {
  const factory Peak({
    required String id,
    required String name,
    required int altitudeMeters,
    required double latitude,
    required double longitude,
    required String regionId,
    required String rangeName,
    required double verificationRadiusMeters,
    required bool isActive,
  }) = _Peak;
}
