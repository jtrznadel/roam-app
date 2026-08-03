import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_session_entity.dart';
import '../repositories/auth_repository.dart';

class RefreshSessionUseCase
    implements UseCase<AuthSessionEntity, RefreshSessionParams> {
  final AuthRepository _repo;

  const RefreshSessionUseCase({required AuthRepository repo}) : _repo = repo;

  @override
  Future<Either<Failure, AuthSessionEntity>> call(RefreshSessionParams params) {
    return _repo.refreshSession(refreshToken: params.refreshToken);
  }
}

class RefreshSessionParams {
  final String refreshToken;

  const RefreshSessionParams({required this.refreshToken});
}
