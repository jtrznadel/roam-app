import 'package:drift/drift.dart';

@TableIndex(name: 'peaks_region_id_idx', columns: {#regionId})
class PeakRecords extends Table {
  @override
  String get tableName => 'peaks';

  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get altitudeMeters => integer()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get regionId => text()();
  TextColumn get rangeName => text()();
  RealColumn get verificationRadiusMeters => real()();
  BoolColumn get isActive => boolean()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}
