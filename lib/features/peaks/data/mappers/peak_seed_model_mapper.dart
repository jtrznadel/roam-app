import 'package:roam/core/database/app_database.dart';
import 'package:roam/features/peaks/data/models/peak_catalog_seed_model.dart';

extension PeakSeedModelMapper on PeakSeedModel {
  PeakRecordsCompanion toCompanion({required String regionId}) {
    return PeakRecordsCompanion.insert(
      id: id,
      name: name,
      altitudeMeters: altitudeMeters,
      latitude: latitude,
      longitude: longitude,
      regionId: regionId,
      rangeName: rangeName,
      verificationRadiusMeters: verificationRadiusMeters,
      isActive: isActive,
    );
  }
}
