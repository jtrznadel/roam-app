import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/usecase/usecase.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<Unit, LogoutParams> {
  final AuthRepository _repo;

  const LogoutUseCase({required AuthRepository repo}) : _repo = repo;

  @override
  Future<Either<Failure, Unit>> call(LogoutParams params) =>
      _repo.logout(refreshToken: params.refreshToken);
}

class LogoutParams {
  final String refreshToken;

  const LogoutParams({required this.refreshToken});
}
