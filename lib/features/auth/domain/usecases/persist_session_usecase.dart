import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/usecase/usecase.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class PersistSessionUseCase implements UseCase<Unit, PersistSessionParams> {
  final AuthRepository _repo;

  const PersistSessionUseCase({required AuthRepository repo}) : _repo = repo;

  @override
  Future<Either<Failure, Unit>> call(PersistSessionParams params) {
    return _repo.persistSession(session: params.session);
  }
}

class PersistSessionParams {
  final AuthSessionEntity session;

  const PersistSessionParams({required this.session});
}
