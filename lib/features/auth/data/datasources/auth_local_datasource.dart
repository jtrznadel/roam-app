import 'package:roam/features/auth/data/models/auth_session_model.dart';
import 'package:roam/features/auth/data/services/auth_local_service.dart';

abstract class AuthLocalDatasource {
  Future<AuthSessionModel?> getStoredSession();

  Future<void> persistSession(AuthSessionModel session);

  Future<void> clearSession();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final AuthLocalService _authLocalService;

  const AuthLocalDatasourceImpl({required this._authLocalService});

  @override
  Future<AuthSessionModel?> getStoredSession() {
    return _authLocalService.getSession();
  }

  @override
  Future<void> persistSession(AuthSessionModel session) {
    return _authLocalService.saveSession(session);
  }

  @override
  Future<void> clearSession() {
    return _authLocalService.removeSession();
  }
}
