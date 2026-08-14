import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';
import 'package:roam/core/utils/usecases/usecase.dart';
import 'package:roam/features/auth/domain/repositories/auth_repository.dart';

class RequestEmailOtpUseCase implements UseCase<Unit, RequestEmailOtpParams> {
  final AuthRepository _repo;

  const RequestEmailOtpUseCase({required this._repo});

  @override
  Future<Either<Failure, Unit>> call(RequestEmailOtpParams params) {
    return _repo.requestEmailOtp(email: params.email);
  }
}

class RequestEmailOtpParams {
  final String email;

  const RequestEmailOtpParams({required this.email});
}
