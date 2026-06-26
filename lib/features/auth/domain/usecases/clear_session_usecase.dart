import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/usecase/usecase.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class ClearSessionUseCase implements NoParamsUseCase<Unit> {
  final AuthRepository _repo;

  const ClearSessionUseCase({required AuthRepository repo}) : _repo = repo;

  @override
  Future<Either<Failure, Unit>> call() {
    return _repo.clearSession();
  }
}
