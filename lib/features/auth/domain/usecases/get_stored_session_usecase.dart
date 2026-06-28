import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/usecase/usecase.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class GetStoredSessionUseCase implements NoParamsUseCase<AuthSessionEntity?> {
  final AuthRepository _repo;

  const GetStoredSessionUseCase({required AuthRepository repo}) : _repo = repo;

  @override
  Future<Either<Failure, AuthSessionEntity?>> call() {
    return _repo.getStoredSession();
  }
}
