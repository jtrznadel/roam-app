import 'package:drift/drift.dart';
import 'package:roam/core/database/app_database.dart';
import 'package:roam/features/peaks/data/local/tables/peak_catalog_metadata_table.dart';
import 'package:roam/features/peaks/data/local/tables/peaks_table.dart';

part 'peak_dao.g.dart';

@DriftAccessor(tables: [PeakRecords, PeakCatalogMetadata])
class PeakDao extends DatabaseAccessor<AppDatabase> with _$PeakDaoMixin {
  PeakDao(super.attachedDatabase);

  Future<PeakRecord?> findById(String peakId) {
    return (select(
      peakRecords,
    )..where((record) => record.id.equals(peakId))).getSingleOrNull();
  }

  Future<List<PeakRecord>> findActiveWithinBounds({
    required double minLatitude,
    required double maxLatitude,
    required double minLongitude,
    required double maxLongitude,
  }) {
    return (select(peakRecords)..where(
          (record) =>
              record.isActive.equals(true) &
              record.latitude.isBiggerOrEqualValue(minLatitude) &
              record.latitude.isSmallerOrEqualValue(maxLatitude) &
              record.longitude.isBiggerOrEqualValue(minLongitude) &
              record.longitude.isSmallerOrEqualValue(maxLongitude),
        ))
        .get();
  }

  Future<void> insertInitialCatalogIfAbsent({
    required String catalogId,
    required int catalogVersion,
    required DateTime seededAtUtc,
    required List<PeakRecordsCompanion> peaks,
  }) async {
    await transaction(() async {
      final metadata = await (select(
        peakCatalogMetadata,
      )..where((entry) => entry.catalogId.equals(catalogId))).getSingleOrNull();

      if (metadata != null) {
        return;
      }

      await batch((batch) {
        batch.insertAll(peakRecords, peaks);
        batch.insert(
          peakCatalogMetadata,
          PeakCatalogMetadataCompanion(
            catalogId: Value(catalogId),
            version: Value(catalogVersion),
            seededAtUtc: Value(seededAtUtc),
          ),
        );
      });
    });
  }
}
