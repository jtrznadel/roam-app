import 'package:drift/drift.dart';

class PeakCatalogMetadata extends Table {
  TextColumn get catalogId => text()();
  IntColumn get version => integer()();
  DateTimeColumn get seededAtUtc => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {catalogId};
}
