import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roam/core/router/auth_status_provider.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/usecases/get_stored_session_usecase.dart';
import 'package:roam/features/auth/domain/usecases/logout_usecase.dart';
import 'package:roam/features/auth/domain/usecases/persist_session_usecase.dart';

import '../../domain/usecases/clear_session_usecase.dart';
import '../../domain/usecases/refresh_session_usecase.dart';

part 'auth_session_cubit.freezed.dart';
part 'auth_session_state.dart';

class AuthSessionCubit extends Cubit<AuthSessionState>
    implements AuthStatusProvider {
  final GetStoredSessionUseCase _getStoredSessionUseCase;
  final PersistSessionUseCase _persistSessionUseCase;
  final RefreshSessionUseCase _refreshSessionUseCase;
  final ClearSessionUseCase _clearSessionUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthSessionCubit({
    required this._getStoredSessionUseCase,
    required this._persistSessionUseCase,
    required this._refreshSessionUseCase,
    required this._clearSessionUseCase,
    required this._logoutUseCase,
  }) : super(const AuthSessionState.bootstrapping());

  @override
  bool get isBootstrapping => state.isBootstrapping;

  @override
  bool get isAuthenticated => state.isAuthenticated;

  Future<void> bootstrap() async {
    emit(const AuthSessionState.bootstrapping());

    final storedResult = await _getStoredSessionUseCase();

    final storedSession = storedResult.fold((failure) {
      addError(failure, StackTrace.current);
      return null;
    }, (session) => session);

    if (storedSession == null) {
      await invalidateSession();
      return;
    }

    final refreshResult = await _refreshSessionUseCase(
      RefreshSessionParams(refreshToken: storedSession.refreshToken),
    );

    await refreshResult.fold<Future<void>>((_) => invalidateSession(), (
      session,
    ) async {
      emit(AuthSessionState.authenticated(session: session));
    });
  }

  Future<void> establishSession(AuthSessionEntity session) async {
    final result = await _persistSessionUseCase(
      PersistSessionParams(session: session),
    );

    result.fold(
      (_) => emit(const AuthSessionState.unauthenticated()),
      (_) => emit(AuthSessionState.authenticated(session: session)),
    );
  }

  Future<void> logout() async {
    final storedResult = await _getStoredSessionUseCase();
    final refreshToken = storedResult.fold(
      (_) => null,
      (session) => session?.refreshToken,
    );

    await invalidateSession();

    if (refreshToken == null) {
      return;
    }

    await _logoutUseCase(LogoutParams(refreshToken: refreshToken));
  }

  Future<void> invalidateSession() async {
    final clearResult = await _clearSessionUseCase();

    clearResult.fold(
      (failure) => addError(failure, StackTrace.current),
      (_) {},
    );

    emit(const AuthSessionState.unauthenticated());
  }
}
