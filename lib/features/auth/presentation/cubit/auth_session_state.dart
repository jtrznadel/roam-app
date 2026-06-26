part of 'auth_session_cubit.dart';

@freezed
abstract class AuthSessionState with _$AuthSessionState {
  const factory AuthSessionState.bootstrapping() = _Bootstrapping;
  const factory AuthSessionState.unauthenticated() = _Unauthenticated;
  const factory AuthSessionState.authenticated({
    required AuthSessionEntity session,
  }) = _Authenticated;

  const AuthSessionState._();

  bool get isBootstrapping =>
      maybeWhen(bootstrapping: () => true, orElse: () => false);

  bool get isAuthenticated =>
      maybeWhen(authenticated: (_) => true, orElse: () => false);

  bool get isUnauthenticated =>
      maybeWhen(unauthenticated: () => true, orElse: () => false);
}
