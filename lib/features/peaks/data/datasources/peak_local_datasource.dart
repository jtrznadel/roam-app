import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:roam/core/database/app_database.dart';
import 'package:roam/features/peaks/data/local/daos/peak_dao.dart';
import 'package:roam/features/peaks/data/mappers/peak_seed_model_mapper.dart';
import 'package:roam/features/peaks/data/models/peak_catalog_seed_model.dart';

abstract interface class PeakLocalDatasource {
  Future<void> seedCatalogIfNeeded();

  Future<PeakRecord?> getById(String peakId);

  Future<List<PeakRecord>> getActiveWithinBounds({
    required double minLatitude,
    required double maxLatitude,
    required double minLongitude,
    required double maxLongitude,
  });
}

class PeakLocalDatasourceImpl implements PeakLocalDatasource {
  static const _seedAssetPath = 'assets/data/peaks/tatry_polskie.v1.json';

  final PeakDao _peakDao;

  const PeakLocalDatasourceImpl({required this._peakDao});

  @override
  Future<List<PeakRecord>> getActiveWithinBounds({
    required double minLatitude,
    required double maxLatitude,
    required double minLongitude,
    required double maxLongitude,
  }) {
    return _peakDao.findActiveWithinBounds(
      minLatitude: minLatitude,
      maxLatitude: maxLatitude,
      minLongitude: minLongitude,
      maxLongitude: maxLongitude,
    );
  }

  @override
  Future<PeakRecord?> getById(String peakId) {
    return _peakDao.findById(peakId);
  }

  @override
  Future<void> seedCatalogIfNeeded() async {
    final seed = await _loadSeed();

    await _peakDao.insertInitialCatalogIfAbsent(
      catalogId: seed.region.id,
      catalogVersion: seed.catalogVersion,
      seededAtUtc: DateTime.now().toUtc(),
      peaks: seed.peaks
          .map((peak) => peak.toCompanion(regionId: seed.region.id))
          .toList(growable: false),
    );
  }

  Future<PeakCatalogSeedModel> _loadSeed() async {
    final rawJson = await rootBundle.loadString(_seedAssetPath);
    final json = jsonDecode(rawJson) as Map<String, dynamic>;

    return PeakCatalogSeedModel.fromJson(json);
  }
}
