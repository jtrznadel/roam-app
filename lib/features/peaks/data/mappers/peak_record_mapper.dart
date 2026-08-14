import 'package:roam/core/database/app_database.dart';
import 'package:roam/features/peaks/domain/entities/peak.dart';

extension PeakRecordMapper on PeakRecord {
  Peak toEntity() {
    return Peak(
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
