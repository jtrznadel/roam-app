import 'package:json_annotation/json_annotation.dart';

part 'peak_catalog_seed_model.g.dart';

@JsonSerializable(createToJson: false)
class PeakCatalogSeedModel {
  final int catalogVersion;
  final PeakCatalogRegionSeedModel region;
  final List<PeakSeedModel> peaks;

  const PeakCatalogSeedModel({
    required this.catalogVersion,
    required this.region,
    required this.peaks,
  });

  factory PeakCatalogSeedModel.fromJson(Map<String, dynamic> json) =>
      _$PeakCatalogSeedModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PeakCatalogRegionSeedModel {
  final String id;
  final String name;

  const PeakCatalogRegionSeedModel({required this.id, required this.name});

  factory PeakCatalogRegionSeedModel.fromJson(Map<String, dynamic> json) =>
      _$PeakCatalogRegionSeedModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PeakSeedModel {
  final String id;
  final String name;
  final int altitudeMeters;
  final double latitude;
  final double longitude;
  final String rangeName;
  final double verificationRadiusMeters;
  final bool isActive;

  const PeakSeedModel({
    required this.id,
    required this.name,
    required this.altitudeMeters,
    required this.latitude,
    required this.longitude,
    required this.rangeName,
    required this.verificationRadiusMeters,
    required this.isActive,
  });

  factory PeakSeedModel.fromJson(Map<String, dynamic> json) =>
      _$PeakSeedModelFromJson(json);
}
