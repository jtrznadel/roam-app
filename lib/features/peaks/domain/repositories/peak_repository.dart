import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/features/peaks/domain/entities/peak.dart';

abstract interface class PeakRepository {
  Future<Either<Failure, Peak?>> getById(String peakId);

  Future<Either<Failure, List<Peak>>> getNearbyPeaks({
    required double latitude,
    required double longitude,
    required double searchRadiusMeters,
    int? limit,
  });
}
