import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:roam/features/peaks/data/local/daos/peak_dao.dart';
import 'package:roam/features/peaks/data/local/tables/peak_catalog_metadata_table.dart';
import 'package:roam/features/peaks/data/local/tables/peaks_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PeakRecords, PeakCatalogMetadata], daos: [PeakDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'roam'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
