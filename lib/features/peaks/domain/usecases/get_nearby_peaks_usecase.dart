import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/usecase/usecase.dart';
import 'package:roam/features/peaks/domain/entities/peak.dart';
import 'package:roam/features/peaks/domain/repositories/peak_repository.dart';

class GetNearbyPeaksUseCase
    implements UseCase<List<Peak>, GetNearbyPeaksUseCaseParams> {
  final PeakRepository _repository;

  const GetNearbyPeaksUseCase({required this._repository});

  @override
  Future<Either<Failure, List<Peak>>> call(GetNearbyPeaksUseCaseParams params) {
    return _repository.getNearbyPeaks(
      latitude: params.latitude,
      longitude: params.longitude,
      searchRadiusMeters: params.searchRadiusMeters,
      limit: params.limit,
    );
  }
}

class GetNearbyPeaksUseCaseParams {
  final double latitude;
  final double longitude;
  final double searchRadiusMeters;
  final int? limit;

  const GetNearbyPeaksUseCaseParams({
    required this.latitude,
    required this.longitude,
    required this.searchRadiusMeters,
    this.limit,
  });
}
