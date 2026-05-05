import 'package:dartz/dartz.dart';
import 'package:roam/core/error/failure.dart';

abstract interface class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract interface class NoParamsUseCase<T> {
  Future<Either<Failure, T>> call();
}
