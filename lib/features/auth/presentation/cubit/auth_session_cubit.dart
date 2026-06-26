import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:roam/features/auth/domain/entities/auth_session_entity.dart';
import 'package:roam/features/auth/domain/usecases/get_stored_session_usecase.dart';
import 'package:roam/features/auth/domain/usecases/logout_usecase.dart';
import 'package:roam/features/auth/domain/usecases/persist_session_usecase.dart';

part 'auth_session_cubit.freezed.dart';
part 'auth_session_state.dart';

class AuthSessionCubit extends Cubit<AuthSessionState> {
  final GetStoredSessionUseCase _getStoredSessionUseCase;
  final PersistSessionUseCase _persistSessionUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthSessionCubit({
    required GetStoredSessionUseCase getStoredSessionUseCase,
    required PersistSessionUseCase persistSessionUseCase,
    required LogoutUseCase logoutUseCase,
  }) : _getStoredSessionUseCase = getStoredSessionUseCase,
       _persistSessionUseCase = persistSessionUseCase,
       _logoutUseCase = logoutUseCase,
       super(const AuthSessionState.bootstrapping());

  Future<void> bootstrap() async {
    emit(const AuthSessionState.bootstrapping());

    final result = await _getStoredSessionUseCase();

    result.fold((_) => emit(const AuthSessionState.unauthenticated()), (
      session,
    ) {
      if (session == null) {
        emit(const AuthSessionState.unauthenticated());
        return;
      }

      emit(AuthSessionState.authenticated(session: session));
    });
  }

  Future<void> establishSession(AuthSessionEntity session) async {
    emit(const AuthSessionState.bootstrapping());

    final result = await _persistSessionUseCase(
      PersistSessionParams(session: session),
    );

    result.fold(
      (_) => emit(const AuthSessionState.unauthenticated()),
      (_) => emit(AuthSessionState.authenticated(session: session)),
    );
  }

  Future<void> logout() async {
    emit(const AuthSessionState.bootstrapping());

    final result = await _logoutUseCase();

    result.fold(
      (_) => emit(const AuthSessionState.unauthenticated()),
      (_) => emit(const AuthSessionState.unauthenticated()),
    );
  }
}
