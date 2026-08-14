// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peak_dao.dart';

// ignore_for_file: type=lint
mixin _$PeakDaoMixin on DatabaseAccessor<AppDatabase> {
  $PeakRecordsTable get peakRecords => attachedDatabase.peakRecords;
  $PeakCatalogMetadataTable get peakCatalogMetadata =>
      attachedDatabase.peakCatalogMetadata;
  PeakDaoManager get managers => PeakDaoManager(this);
}

class PeakDaoManager {
  final _$PeakDaoMixin _db;
  PeakDaoManager(this._db);
  $$PeakRecordsTableTableManager get peakRecords =>
      $$PeakRecordsTableTableManager(_db.attachedDatabase, _db.peakRecords);
  $$PeakCatalogMetadataTableTableManager get peakCatalogMetadata =>
      $$PeakCatalogMetadataTableTableManager(
        _db.attachedDatabase,
        _db.peakCatalogMetadata,
      );
}
