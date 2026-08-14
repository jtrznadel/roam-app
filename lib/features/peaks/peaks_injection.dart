import 'package:roam/core/database/app_database.dart';
import 'package:roam/core/di/dependency_injection.dart';
import 'package:roam/features/peaks/data/datasources/peak_local_datasource.dart';
import 'package:roam/features/peaks/data/local/daos/peak_dao.dart';
import 'package:roam/features/peaks/data/repositories/peak_repository_impl.dart';
import 'package:roam/features/peaks/domain/repositories/peak_repository.dart';
import 'package:roam/features/peaks/domain/usecases/get_nearby_peaks_usecase.dart';

void initPeaksInjection() {
  sl.registerLazySingleton<AppDatabase>(AppDatabase.new);

  sl.registerLazySingleton<PeakDao>(() => sl<AppDatabase>().peakDao);

  sl.registerLazySingleton<PeakLocalDatasource>(
    () => PeakLocalDatasourceImpl(peakDao: sl()),
  );

  sl.registerLazySingleton<PeakRepository>(
    () => PeakRepositoryImpl(localDatasource: sl()),
  );

  sl.registerLazySingleton(() => GetNearbyPeaksUseCase(repo: sl()));
}
