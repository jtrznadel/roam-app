// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PeakRecordsTable extends PeakRecords
    with TableInfo<$PeakRecordsTable, PeakRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeakRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _altitudeMetersMeta = const VerificationMeta(
    'altitudeMeters',
  );
  @override
  late final GeneratedColumn<int> altitudeMeters = GeneratedColumn<int>(
    'altitude_meters',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regionIdMeta = const VerificationMeta(
    'regionId',
  );
  @override
  late final GeneratedColumn<String> regionId = GeneratedColumn<String>(
    'region_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rangeNameMeta = const VerificationMeta(
    'rangeName',
  );
  @override
  late final GeneratedColumn<String> rangeName = GeneratedColumn<String>(
    'range_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _verificationRadiusMetersMeta =
      const VerificationMeta('verificationRadiusMeters');
  @override
  late final GeneratedColumn<double> verificationRadiusMeters =
      GeneratedColumn<double>(
        'verification_radius_meters',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    altitudeMeters,
    latitude,
    longitude,
    regionId,
    rangeName,
    verificationRadiusMeters,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'peaks';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeakRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('altitude_meters')) {
      context.handle(
        _altitudeMetersMeta,
        altitudeMeters.isAcceptableOrUnknown(
          data['altitude_meters']!,
          _altitudeMetersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_altitudeMetersMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('region_id')) {
      context.handle(
        _regionIdMeta,
        regionId.isAcceptableOrUnknown(data['region_id']!, _regionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_regionIdMeta);
    }
    if (data.containsKey('range_name')) {
      context.handle(
        _rangeNameMeta,
        rangeName.isAcceptableOrUnknown(data['range_name']!, _rangeNameMeta),
      );
    } else if (isInserting) {
      context.missing(_rangeNameMeta);
    }
    if (data.containsKey('verification_radius_meters')) {
      context.handle(
        _verificationRadiusMetersMeta,
        verificationRadiusMeters.isAcceptableOrUnknown(
          data['verification_radius_meters']!,
          _verificationRadiusMetersMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_verificationRadiusMetersMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PeakRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeakRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      altitudeMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}altitude_meters'],
      )!,
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      regionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region_id'],
      )!,
      rangeName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}range_name'],
      )!,
      verificationRadiusMeters: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}verification_radius_meters'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $PeakRecordsTable createAlias(String alias) {
    return $PeakRecordsTable(attachedDatabase, alias);
  }
}

class PeakRecord extends DataClass implements Insertable<PeakRecord> {
  final String id;
  final String name;
  final int altitudeMeters;
  final double latitude;
  final double longitude;
  final String regionId;
  final String rangeName;
  final double verificationRadiusMeters;
  final bool isActive;
  const PeakRecord({
    required this.id,
    required this.name,
    required this.altitudeMeters,
    required this.latitude,
    required this.longitude,
    required this.regionId,
    required this.rangeName,
    required this.verificationRadiusMeters,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['altitude_meters'] = Variable<int>(altitudeMeters);
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    map['region_id'] = Variable<String>(regionId);
    map['range_name'] = Variable<String>(rangeName);
    map['verification_radius_meters'] = Variable<double>(
      verificationRadiusMeters,
    );
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  PeakRecordsCompanion toCompanion(bool nullToAbsent) {
    return PeakRecordsCompanion(
      id: Value(id),
      name: Value(name),
      altitudeMeters: Value(altitudeMeters),
      latitude: Value(latitude),
      longitude: Value(longitude),
      regionId: Value(regionId),
      rangeName: Value(rangeName),
      verificationRadiusMeters: Value(verificationRadiusMeters),
      isActive: Value(isActive),
    );
  }

  factory PeakRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeakRecord(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      altitudeMeters: serializer.fromJson<int>(json['altitudeMeters']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      regionId: serializer.fromJson<String>(json['regionId']),
      rangeName: serializer.fromJson<String>(json['rangeName']),
      verificationRadiusMeters: serializer.fromJson<double>(
        json['verificationRadiusMeters'],
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'altitudeMeters': serializer.toJson<int>(altitudeMeters),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'regionId': serializer.toJson<String>(regionId),
      'rangeName': serializer.toJson<String>(rangeName),
      'verificationRadiusMeters': serializer.toJson<double>(
        verificationRadiusMeters,
      ),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  PeakRecord copyWith({
    String? id,
    String? name,
    int? altitudeMeters,
    double? latitude,
    double? longitude,
    String? regionId,
    String? rangeName,
    double? verificationRadiusMeters,
    bool? isActive,
  }) => PeakRecord(
    id: id ?? this.id,
    name: name ?? this.name,
    altitudeMeters: altitudeMeters ?? this.altitudeMeters,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    regionId: regionId ?? this.regionId,
    rangeName: rangeName ?? this.rangeName,
    verificationRadiusMeters:
        verificationRadiusMeters ?? this.verificationRadiusMeters,
    isActive: isActive ?? this.isActive,
  );
  PeakRecord copyWithCompanion(PeakRecordsCompanion data) {
    return PeakRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      altitudeMeters: data.altitudeMeters.present
          ? data.altitudeMeters.value
          : this.altitudeMeters,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      regionId: data.regionId.present ? data.regionId.value : this.regionId,
      rangeName: data.rangeName.present ? data.rangeName.value : this.rangeName,
      verificationRadiusMeters: data.verificationRadiusMeters.present
          ? data.verificationRadiusMeters.value
          : this.verificationRadiusMeters,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeakRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('altitudeMeters: $altitudeMeters, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('regionId: $regionId, ')
          ..write('rangeName: $rangeName, ')
          ..write('verificationRadiusMeters: $verificationRadiusMeters, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    altitudeMeters,
    latitude,
    longitude,
    regionId,
    rangeName,
    verificationRadiusMeters,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeakRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.altitudeMeters == this.altitudeMeters &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.regionId == this.regionId &&
          other.rangeName == this.rangeName &&
          other.verificationRadiusMeters == this.verificationRadiusMeters &&
          other.isActive == this.isActive);
}

class PeakRecordsCompanion extends UpdateCompanion<PeakRecord> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> altitudeMeters;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<String> regionId;
  final Value<String> rangeName;
  final Value<double> verificationRadiusMeters;
  final Value<bool> isActive;
  final Value<int> rowid;
  const PeakRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.altitudeMeters = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.regionId = const Value.absent(),
    this.rangeName = const Value.absent(),
    this.verificationRadiusMeters = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PeakRecordsCompanion.insert({
    required String id,
    required String name,
    required int altitudeMeters,
    required double latitude,
    required double longitude,
    required String regionId,
    required String rangeName,
    required double verificationRadiusMeters,
    required bool isActive,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       altitudeMeters = Value(altitudeMeters),
       latitude = Value(latitude),
       longitude = Value(longitude),
       regionId = Value(regionId),
       rangeName = Value(rangeName),
       verificationRadiusMeters = Value(verificationRadiusMeters),
       isActive = Value(isActive);
  static Insertable<PeakRecord> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? altitudeMeters,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<String>? regionId,
    Expression<String>? rangeName,
    Expression<double>? verificationRadiusMeters,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (altitudeMeters != null) 'altitude_meters': altitudeMeters,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (regionId != null) 'region_id': regionId,
      if (rangeName != null) 'range_name': rangeName,
      if (verificationRadiusMeters != null)
        'verification_radius_meters': verificationRadiusMeters,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PeakRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? altitudeMeters,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<String>? regionId,
    Value<String>? rangeName,
    Value<double>? verificationRadiusMeters,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return PeakRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      altitudeMeters: altitudeMeters ?? this.altitudeMeters,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      regionId: regionId ?? this.regionId,
      rangeName: rangeName ?? this.rangeName,
      verificationRadiusMeters:
          verificationRadiusMeters ?? this.verificationRadiusMeters,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (altitudeMeters.present) {
      map['altitude_meters'] = Variable<int>(altitudeMeters.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (regionId.present) {
      map['region_id'] = Variable<String>(regionId.value);
    }
    if (rangeName.present) {
      map['range_name'] = Variable<String>(rangeName.value);
    }
    if (verificationRadiusMeters.present) {
      map['verification_radius_meters'] = Variable<double>(
        verificationRadiusMeters.value,
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeakRecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('altitudeMeters: $altitudeMeters, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('regionId: $regionId, ')
          ..write('rangeName: $rangeName, ')
          ..write('verificationRadiusMeters: $verificationRadiusMeters, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PeakCatalogMetadataTable extends PeakCatalogMetadata
    with TableInfo<$PeakCatalogMetadataTable, PeakCatalogMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeakCatalogMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _catalogIdMeta = const VerificationMeta(
    'catalogId',
  );
  @override
  late final GeneratedColumn<String> catalogId = GeneratedColumn<String>(
    'catalog_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _seededAtUtcMeta = const VerificationMeta(
    'seededAtUtc',
  );
  @override
  late final GeneratedColumn<DateTime> seededAtUtc = GeneratedColumn<DateTime>(
    'seeded_at_utc',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [catalogId, version, seededAtUtc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'peak_catalog_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<PeakCatalogMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('catalog_id')) {
      context.handle(
        _catalogIdMeta,
        catalogId.isAcceptableOrUnknown(data['catalog_id']!, _catalogIdMeta),
      );
    } else if (isInserting) {
      context.missing(_catalogIdMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('seeded_at_utc')) {
      context.handle(
        _seededAtUtcMeta,
        seededAtUtc.isAcceptableOrUnknown(
          data['seeded_at_utc']!,
          _seededAtUtcMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_seededAtUtcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {catalogId};
  @override
  PeakCatalogMetadataData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PeakCatalogMetadataData(
      catalogId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catalog_id'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}version'],
      )!,
      seededAtUtc: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}seeded_at_utc'],
      )!,
    );
  }

  @override
  $PeakCatalogMetadataTable createAlias(String alias) {
    return $PeakCatalogMetadataTable(attachedDatabase, alias);
  }
}

class PeakCatalogMetadataData extends DataClass
    implements Insertable<PeakCatalogMetadataData> {
  final String catalogId;
  final int version;
  final DateTime seededAtUtc;
  const PeakCatalogMetadataData({
    required this.catalogId,
    required this.version,
    required this.seededAtUtc,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['catalog_id'] = Variable<String>(catalogId);
    map['version'] = Variable<int>(version);
    map['seeded_at_utc'] = Variable<DateTime>(seededAtUtc);
    return map;
  }

  PeakCatalogMetadataCompanion toCompanion(bool nullToAbsent) {
    return PeakCatalogMetadataCompanion(
      catalogId: Value(catalogId),
      version: Value(version),
      seededAtUtc: Value(seededAtUtc),
    );
  }

  factory PeakCatalogMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PeakCatalogMetadataData(
      catalogId: serializer.fromJson<String>(json['catalogId']),
      version: serializer.fromJson<int>(json['version']),
      seededAtUtc: serializer.fromJson<DateTime>(json['seededAtUtc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'catalogId': serializer.toJson<String>(catalogId),
      'version': serializer.toJson<int>(version),
      'seededAtUtc': serializer.toJson<DateTime>(seededAtUtc),
    };
  }

  PeakCatalogMetadataData copyWith({
    String? catalogId,
    int? version,
    DateTime? seededAtUtc,
  }) => PeakCatalogMetadataData(
    catalogId: catalogId ?? this.catalogId,
    version: version ?? this.version,
    seededAtUtc: seededAtUtc ?? this.seededAtUtc,
  );
  PeakCatalogMetadataData copyWithCompanion(PeakCatalogMetadataCompanion data) {
    return PeakCatalogMetadataData(
      catalogId: data.catalogId.present ? data.catalogId.value : this.catalogId,
      version: data.version.present ? data.version.value : this.version,
      seededAtUtc: data.seededAtUtc.present
          ? data.seededAtUtc.value
          : this.seededAtUtc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PeakCatalogMetadataData(')
          ..write('catalogId: $catalogId, ')
          ..write('version: $version, ')
          ..write('seededAtUtc: $seededAtUtc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(catalogId, version, seededAtUtc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PeakCatalogMetadataData &&
          other.catalogId == this.catalogId &&
          other.version == this.version &&
          other.seededAtUtc == this.seededAtUtc);
}

class PeakCatalogMetadataCompanion
    extends UpdateCompanion<PeakCatalogMetadataData> {
  final Value<String> catalogId;
  final Value<int> version;
  final Value<DateTime> seededAtUtc;
  final Value<int> rowid;
  const PeakCatalogMetadataCompanion({
    this.catalogId = const Value.absent(),
    this.version = const Value.absent(),
    this.seededAtUtc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PeakCatalogMetadataCompanion.insert({
    required String catalogId,
    required int version,
    required DateTime seededAtUtc,
    this.rowid = const Value.absent(),
  }) : catalogId = Value(catalogId),
       version = Value(version),
       seededAtUtc = Value(seededAtUtc);
  static Insertable<PeakCatalogMetadataData> custom({
    Expression<String>? catalogId,
    Expression<int>? version,
    Expression<DateTime>? seededAtUtc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (catalogId != null) 'catalog_id': catalogId,
      if (version != null) 'version': version,
      if (seededAtUtc != null) 'seeded_at_utc': seededAtUtc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PeakCatalogMetadataCompanion copyWith({
    Value<String>? catalogId,
    Value<int>? version,
    Value<DateTime>? seededAtUtc,
    Value<int>? rowid,
  }) {
    return PeakCatalogMetadataCompanion(
      catalogId: catalogId ?? this.catalogId,
      version: version ?? this.version,
      seededAtUtc: seededAtUtc ?? this.seededAtUtc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (catalogId.present) {
      map['catalog_id'] = Variable<String>(catalogId.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (seededAtUtc.present) {
      map['seeded_at_utc'] = Variable<DateTime>(seededAtUtc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeakCatalogMetadataCompanion(')
          ..write('catalogId: $catalogId, ')
          ..write('version: $version, ')
          ..write('seededAtUtc: $seededAtUtc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PeakRecordsTable peakRecords = $PeakRecordsTable(this);
  late final $PeakCatalogMetadataTable peakCatalogMetadata =
      $PeakCatalogMetadataTable(this);
  late final Index peaksRegionIdIdx = Index(
    'peaks_region_id_idx',
    'CREATE INDEX peaks_region_id_idx ON peaks (region_id)',
  );
  late final PeakDao peakDao = PeakDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    peakRecords,
    peakCatalogMetadata,
    peaksRegionIdIdx,
  ];
}

typedef $$PeakRecordsTableCreateCompanionBuilder =
    PeakRecordsCompanion Function({
      required String id,
      required String name,
      required int altitudeMeters,
      required double latitude,
      required double longitude,
      required String regionId,
      required String rangeName,
      required double verificationRadiusMeters,
      required bool isActive,
      Value<int> rowid,
    });
typedef $$PeakRecordsTableUpdateCompanionBuilder =
    PeakRecordsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> altitudeMeters,
      Value<double> latitude,
      Value<double> longitude,
      Value<String> regionId,
      Value<String> rangeName,
      Value<double> verificationRadiusMeters,
      Value<bool> isActive,
      Value<int> rowid,
    });

class $$PeakRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PeakRecordsTable> {
  $$PeakRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get altitudeMeters => $composableBuilder(
    column: $table.altitudeMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regionId => $composableBuilder(
    column: $table.regionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rangeName => $composableBuilder(
    column: $table.rangeName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get verificationRadiusMeters => $composableBuilder(
    column: $table.verificationRadiusMeters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PeakRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PeakRecordsTable> {
  $$PeakRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get altitudeMeters => $composableBuilder(
    column: $table.altitudeMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regionId => $composableBuilder(
    column: $table.regionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rangeName => $composableBuilder(
    column: $table.rangeName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get verificationRadiusMeters => $composableBuilder(
    column: $table.verificationRadiusMeters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PeakRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeakRecordsTable> {
  $$PeakRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get altitudeMeters => $composableBuilder(
    column: $table.altitudeMeters,
    builder: (column) => column,
  );

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<String> get regionId =>
      $composableBuilder(column: $table.regionId, builder: (column) => column);

  GeneratedColumn<String> get rangeName =>
      $composableBuilder(column: $table.rangeName, builder: (column) => column);

  GeneratedColumn<double> get verificationRadiusMeters => $composableBuilder(
    column: $table.verificationRadiusMeters,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);
}

class $$PeakRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeakRecordsTable,
          PeakRecord,
          $$PeakRecordsTableFilterComposer,
          $$PeakRecordsTableOrderingComposer,
          $$PeakRecordsTableAnnotationComposer,
          $$PeakRecordsTableCreateCompanionBuilder,
          $$PeakRecordsTableUpdateCompanionBuilder,
          (
            PeakRecord,
            BaseReferences<_$AppDatabase, $PeakRecordsTable, PeakRecord>,
          ),
          PeakRecord,
          PrefetchHooks Function()
        > {
  $$PeakRecordsTableTableManager(_$AppDatabase db, $PeakRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeakRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeakRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeakRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> altitudeMeters = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<String> regionId = const Value.absent(),
                Value<String> rangeName = const Value.absent(),
                Value<double> verificationRadiusMeters = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeakRecordsCompanion(
                id: id,
                name: name,
                altitudeMeters: altitudeMeters,
                latitude: latitude,
                longitude: longitude,
                regionId: regionId,
                rangeName: rangeName,
                verificationRadiusMeters: verificationRadiusMeters,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int altitudeMeters,
                required double latitude,
                required double longitude,
                required String regionId,
                required String rangeName,
                required double verificationRadiusMeters,
                required bool isActive,
                Value<int> rowid = const Value.absent(),
              }) => PeakRecordsCompanion.insert(
                id: id,
                name: name,
                altitudeMeters: altitudeMeters,
                latitude: latitude,
                longitude: longitude,
                regionId: regionId,
                rangeName: rangeName,
                verificationRadiusMeters: verificationRadiusMeters,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PeakRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeakRecordsTable,
      PeakRecord,
      $$PeakRecordsTableFilterComposer,
      $$PeakRecordsTableOrderingComposer,
      $$PeakRecordsTableAnnotationComposer,
      $$PeakRecordsTableCreateCompanionBuilder,
      $$PeakRecordsTableUpdateCompanionBuilder,
      (
        PeakRecord,
        BaseReferences<_$AppDatabase, $PeakRecordsTable, PeakRecord>,
      ),
      PeakRecord,
      PrefetchHooks Function()
    >;
typedef $$PeakCatalogMetadataTableCreateCompanionBuilder =
    PeakCatalogMetadataCompanion Function({
      required String catalogId,
      required int version,
      required DateTime seededAtUtc,
      Value<int> rowid,
    });
typedef $$PeakCatalogMetadataTableUpdateCompanionBuilder =
    PeakCatalogMetadataCompanion Function({
      Value<String> catalogId,
      Value<int> version,
      Value<DateTime> seededAtUtc,
      Value<int> rowid,
    });

class $$PeakCatalogMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $PeakCatalogMetadataTable> {
  $$PeakCatalogMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get catalogId => $composableBuilder(
    column: $table.catalogId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get seededAtUtc => $composableBuilder(
    column: $table.seededAtUtc,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PeakCatalogMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $PeakCatalogMetadataTable> {
  $$PeakCatalogMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get catalogId => $composableBuilder(
    column: $table.catalogId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get seededAtUtc => $composableBuilder(
    column: $table.seededAtUtc,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PeakCatalogMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $PeakCatalogMetadataTable> {
  $$PeakCatalogMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get catalogId =>
      $composableBuilder(column: $table.catalogId, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get seededAtUtc => $composableBuilder(
    column: $table.seededAtUtc,
    builder: (column) => column,
  );
}

class $$PeakCatalogMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PeakCatalogMetadataTable,
          PeakCatalogMetadataData,
          $$PeakCatalogMetadataTableFilterComposer,
          $$PeakCatalogMetadataTableOrderingComposer,
          $$PeakCatalogMetadataTableAnnotationComposer,
          $$PeakCatalogMetadataTableCreateCompanionBuilder,
          $$PeakCatalogMetadataTableUpdateCompanionBuilder,
          (
            PeakCatalogMetadataData,
            BaseReferences<
              _$AppDatabase,
              $PeakCatalogMetadataTable,
              PeakCatalogMetadataData
            >,
          ),
          PeakCatalogMetadataData,
          PrefetchHooks Function()
        > {
  $$PeakCatalogMetadataTableTableManager(
    _$AppDatabase db,
    $PeakCatalogMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeakCatalogMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeakCatalogMetadataTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PeakCatalogMetadataTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> catalogId = const Value.absent(),
                Value<int> version = const Value.absent(),
                Value<DateTime> seededAtUtc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeakCatalogMetadataCompanion(
                catalogId: catalogId,
                version: version,
                seededAtUtc: seededAtUtc,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String catalogId,
                required int version,
                required DateTime seededAtUtc,
                Value<int> rowid = const Value.absent(),
              }) => PeakCatalogMetadataCompanion.insert(
                catalogId: catalogId,
                version: version,
                seededAtUtc: seededAtUtc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PeakCatalogMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PeakCatalogMetadataTable,
      PeakCatalogMetadataData,
      $$PeakCatalogMetadataTableFilterComposer,
      $$PeakCatalogMetadataTableOrderingComposer,
      $$PeakCatalogMetadataTableAnnotationComposer,
      $$PeakCatalogMetadataTableCreateCompanionBuilder,
      $$PeakCatalogMetadataTableUpdateCompanionBuilder,
      (
        PeakCatalogMetadataData,
        BaseReferences<
          _$AppDatabase,
          $PeakCatalogMetadataTable,
          PeakCatalogMetadataData
        >,
      ),
      PeakCatalogMetadataData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PeakRecordsTableTableManager get peakRecords =>
      $$PeakRecordsTableTableManager(_db, _db.peakRecords);
  $$PeakCatalogMetadataTableTableManager get peakCatalogMetadata =>
      $$PeakCatalogMetadataTableTableManager(_db, _db.peakCatalogMetadata);
}
