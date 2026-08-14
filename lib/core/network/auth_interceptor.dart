import 'package:dio/dio.dart';
import 'package:roam/features/auth/domain/usecases/get_stored_session_usecase.dart';
import 'package:roam/features/auth/domain/usecases/refresh_session_usecase.dart';

import '../../features/auth/domain/entities/auth_session_entity.dart';

class AuthInterceptor extends Interceptor {
  final GetStoredSessionUseCase _getStoredSessionUseCase;
  final RefreshSessionUseCase _refreshSessionUseCase;
  final Dio Function() _dioProvider;
  final Future<void> Function() _onSessionExpired;

  AuthInterceptor({
    required this._getStoredSessionUseCase,
    required this._refreshSessionUseCase,
    required this._dioProvider,
    required this._onSessionExpired,
  });

  static const String _retriedKey = 'auth_retried';
  static const String _authPathPrefix = '/api/v1/auth/';

  Future<bool>? _refreshInProgress;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthEndpoint(options)) {
      handler.next(options);
      return;
    }

    final session = await _getStoredSession();

    if (session != null) {
      options.headers['Authorization'] = _bearerToken(session.accessToken);
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final isUnauthorized = err.response?.statusCode == 401;

    if (!isUnauthorized || _isAuthEndpoint(options)) {
      handler.next(err);
      return;
    }

    if (options.extra[_retriedKey] == true) {
      await _expireSession();
      handler.next(err);
      return;
    }

    final requestBearerToken =
        options.headers['Authorization'] as String? ?? '';

    final refreshed = await _refreshSession(
      requestBearerToken: requestBearerToken,
    );

    if (!refreshed) {
      await _expireSession();
      handler.next(err);
      return;
    }

    final refreshedSession = await _getStoredSession();

    if (refreshedSession == null) {
      await _expireSession();
      handler.next(err);
      return;
    }

    await _retry(
      err: err,
      handler: handler,
      accessToken: refreshedSession.accessToken,
    );
  }

  Future<void> _retry({
    required DioException err,
    required ErrorInterceptorHandler handler,
    required String accessToken,
  }) async {
    final options = err.requestOptions;

    options.headers['Authorization'] = _bearerToken(accessToken);
    options.extra[_retriedKey] = true;

    try {
      final response = await _dioProvider().fetch<dynamic>(options);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  Future<bool> _refreshSession({required String requestBearerToken}) {
    return _refreshInProgress ??=
        _doRefresh(requestBearerToken: requestBearerToken).whenComplete(() {
          _refreshInProgress = null;
        });
  }

  Future<bool> _doRefresh({required String requestBearerToken}) async {
    final currentSession = await _getStoredSession();

    if (currentSession == null) {
      return false;
    }

    if (_bearerToken(currentSession.accessToken) != requestBearerToken) {
      return true;
    }

    final result = await _refreshSessionUseCase(
      RefreshSessionParams(refreshToken: currentSession.refreshToken),
    );

    return result.fold((_) => false, (_) => true);
  }

  Future<AuthSessionEntity?> _getStoredSession() async {
    final result = await _getStoredSessionUseCase();

    return result.fold((_) => null, (session) => session);
  }

  Future<void> _expireSession() async {
    try {
      await _onSessionExpired();
    } catch (_) {}
  }

  bool _isAuthEndpoint(RequestOptions options) {
    return options.path.startsWith(_authPathPrefix);
  }

  String _bearerToken(String accessToken) {
    return 'Bearer $accessToken';
  }
}
