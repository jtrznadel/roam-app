import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:roam/core/error/dio_exception_mapper.dart';
import 'package:roam/core/error/failure.dart';

Future<Either<Failure, T>> handleApiCall<T>(Future<T> Function() action) async {
  try {
    final result = await action();
    return Right(result);
  } on DioException catch (exception) {
    return Left(const DioExceptionMapper().map(exception));
  } catch (_) {
    return Left(const Failure.serverError());
  }
}
