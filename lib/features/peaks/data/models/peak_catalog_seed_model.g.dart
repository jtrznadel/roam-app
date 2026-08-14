// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peak_catalog_seed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeakCatalogSeedModel _$PeakCatalogSeedModelFromJson(
  Map<String, dynamic> json,
) => PeakCatalogSeedModel(
  catalogVersion: (json['catalogVersion'] as num).toInt(),
  region: PeakCatalogRegionSeedModel.fromJson(
    json['region'] as Map<String, dynamic>,
  ),
  peaks: (json['peaks'] as List<dynamic>)
      .map((e) => PeakSeedModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

PeakCatalogRegionSeedModel _$PeakCatalogRegionSeedModelFromJson(
  Map<String, dynamic> json,
) => PeakCatalogRegionSeedModel(
  id: json['id'] as String,
  name: json['name'] as String,
);

PeakSeedModel _$PeakSeedModelFromJson(Map<String, dynamic> json) =>
    PeakSeedModel(
      id: json['id'] as String,
      name: json['name'] as String,
      altitudeMeters: (json['altitudeMeters'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      rangeName: json['rangeName'] as String,
      verificationRadiusMeters: (json['verificationRadiusMeters'] as num)
          .toDouble(),
      isActive: json['isActive'] as bool,
    );
