import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/utils/usecases/usecase.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class RefreshSessionUseCase
    implements UseCase<AuthSessionEntity, RefreshSessionParams> {
  final AuthRepository _repo;

  const RefreshSessionUseCase({required this._repo});

  @override
  Future<Either<Failure, AuthSessionEntity>> call(RefreshSessionParams params) {
    return _repo.refreshSession(refreshToken: params.refreshToken);
  }
}

class RefreshSessionParams {
  final String refreshToken;

  const RefreshSessionParams({required this.refreshToken});
}
