import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/features/peaks/data/datasources/peak_local_datasource.dart';
import 'package:roam/features/peaks/data/mappers/peak_record_mapper.dart';
import 'package:roam/features/peaks/domain/entities/peak.dart';
import 'package:roam/features/peaks/domain/repositories/peak_repository.dart';

class PeakRepositoryImpl implements PeakRepository {
  static const _earthRadiusMeters = 6371008.8;
  static const _defaultNearbyLimit = 3;

  final PeakLocalDatasource _localDatasource;

  const PeakRepositoryImpl({required this._localDatasource});

  @override
  Future<Either<Failure, Peak?>> getById(String peakId) async {
    if (peakId.trim().isEmpty) {
      return const Left(
        Failure.validationError(message: 'Peak id cannot be empty.'),
      );
    }

    try {
      final record = await _localDatasource.getById(peakId);

      return Right(record?.toEntity());
    } catch (_) {
      return const Left(Failure.generalError());
    }
  }

  @override
  Future<Either<Failure, List<Peak>>> getNearbyPeaks({
    required double latitude,
    required double longitude,
    required double searchRadiusMeters,
    int? limit,
  }) async {
    if (!_isValidLocation(
      latitude: latitude,
      longitude: longitude,
      searchRadiusMeters: searchRadiusMeters,
      limit: limit,
    )) {
      return const Left(Failure.validationError());
    }

    final effectiveLimit = limit ?? _defaultNearbyLimit;
    final bounds = _calculateBounds(
      latitude: latitude,
      longitude: longitude,
      radiusMeters: searchRadiusMeters,
    );

    try {
      final records = await _localDatasource.getActiveWithinBounds(
        minLatitude: bounds.minLatitude,
        maxLatitude: bounds.maxLatitude,
        minLongitude: bounds.minLongitude,
        maxLongitude: bounds.maxLongitude,
      );

      final candidates =
          records
              .map((record) {
                final peak = record.toEntity();
                final distanceMeters = _distanceInMeters(
                  startLatitude: latitude,
                  startLongitude: longitude,
                  endLatitude: peak.latitude,
                  endLongitude: peak.longitude,
                );

                return (peak: peak, distanceMeters: distanceMeters);
              })
              .where(
                (candidate) => candidate.distanceMeters <= searchRadiusMeters,
              )
              .toList()
            ..sort(
              (first, second) =>
                  first.distanceMeters.compareTo(second.distanceMeters),
            );

      return Right(
        candidates
            .take(effectiveLimit)
            .map((candidate) => candidate.peak)
            .toList(growable: false),
      );
    } catch (_) {
      return const Left(Failure.generalError());
    }
  }

  bool _isValidLocation({
    required double latitude,
    required double longitude,
    required double searchRadiusMeters,
    required int? limit,
  }) {
    return latitude >= -90 &&
        latitude <= 90 &&
        longitude >= -180 &&
        longitude <= 180 &&
        searchRadiusMeters > 0 &&
        (limit == null || limit > 0);
  }

  _GeoBounds _calculateBounds({
    required double latitude,
    required double longitude,
    required double radiusMeters,
  }) {
    final latitudeDelta = _toDegrees(radiusMeters / _earthRadiusMeters);
    final longitudeDelta = _toDegrees(
      radiusMeters / (_earthRadiusMeters * math.cos(_toRadians(latitude))),
    );

    return _GeoBounds(
      minLatitude: math.max(-90, latitude - latitudeDelta),
      maxLatitude: math.min(90, latitude + latitudeDelta),
      minLongitude: math.max(-180, longitude - longitudeDelta),
      maxLongitude: math.min(180, longitude + longitudeDelta),
    );
  }

  double _distanceInMeters({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    final latitudeDelta = _toRadians(endLatitude - startLatitude);
    final longitudeDelta = _toRadians(endLongitude - startLongitude);

    final haversine =
        math.sin(latitudeDelta / 2) * math.sin(latitudeDelta / 2) +
        math.cos(_toRadians(startLatitude)) *
            math.cos(_toRadians(endLatitude)) *
            math.sin(longitudeDelta / 2) *
            math.sin(longitudeDelta / 2);

    return 2 * _earthRadiusMeters * math.asin(math.sqrt(haversine));
  }

  double _toRadians(double degrees) => degrees * math.pi / 180;

  double _toDegrees(double radians) => radians * 180 / math.pi;
}

class _GeoBounds {
  final double minLatitude;
  final double maxLatitude;
  final double minLongitude;
  final double maxLongitude;

  const _GeoBounds({
    required this.minLatitude,
    required this.maxLatitude,
    required this.minLongitude,
    required this.maxLongitude,
  });
}
