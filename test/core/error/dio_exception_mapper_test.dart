import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roam/core/error/dio_exception_mapper.dart';
import 'package:roam/core/error/failure.dart';

void main() {
  const mapper = DioExceptionMapper();

  group('DioExceptionMapper', () {
    test('maps a SocketException to OfflineError', () {
      final exception = DioException(
        requestOptions: RequestOptions(path: '/auth/session'),
        type: DioExceptionType.connectionError,
        error: const SocketException('No internet connection'),
      );

      expect(mapper.map(exception), const Failure.offlineError());
    });

    test('maps an HTTP 401 response to AuthenticationError', () {
      final requestOptions = RequestOptions(path: '/auth/session');
      final exception = DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.badResponse,
        response: Response<void>(
          requestOptions: requestOptions,
          statusCode: 401,
        ),
      );

      expect(mapper.map(exception), const Failure.authenticationError());
    });

    test('maps another HTTP error to GeneralError with API message', () {
      final requestOptions = RequestOptions(path: '/auth/verify');
      final exception = DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.badResponse,
        response: Response<Map<String, dynamic>>(
          requestOptions: requestOptions,
          statusCode: 422,
          data: {'message': 'Invalid verification code'},
        ),
      );

      expect(
        mapper.map(exception),
        const Failure.generalError(
          message: 'Invalid verification code',
          statusCode: 422,
        ),
      );
    });
  });
}
