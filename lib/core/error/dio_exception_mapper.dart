import 'dart:io';

import 'package:dio/dio.dart';
import 'package:roam/core/error/failure.dart';

class DioExceptionMapper {
  const DioExceptionMapper();

  Failure map(DioException exception) {
    final statusCode = exception.response?.statusCode;
    final message = _extractMessage(exception);

    if (exception.type == DioExceptionType.connectionError &&
        exception.error is SocketException) {
      return const Failure.offlineError();
    }

    switch (exception.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure.connectionError(message: message);

      case DioExceptionType.cancel:
        return const Failure.cancelError();

      case DioExceptionType.badResponse:
        if (statusCode == 401) {
          return const Failure.authenticationError();
        }

        return Failure.generalError(message: message, statusCode: statusCode);

      default:
        return Failure.serverError(message: message, statusCode: statusCode);
    }
  }

  String? _extractMessage(DioException exception) {
    final data = exception.response?.data;

    if (data is Map<String, dynamic>) {
      return data['message'] as String?;
    }

    return exception.message;
  }
}
