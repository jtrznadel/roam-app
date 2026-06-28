import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:roam/features/auth/data/models/auth_session_model.dart';

abstract class AuthLocalService {
  Future<AuthSessionModel?> getSession();

  Future<void> saveSession(AuthSessionModel session);

  Future<void> removeSession();
}

class AuthLocalServiceImpl implements AuthLocalService {
  static const _sessionKey = 'auth_session';

  final FlutterSecureStorage _storage;

  const AuthLocalServiceImpl({required FlutterSecureStorage storage})
    : _storage = storage;

  @override
  Future<AuthSessionModel?> getSession() async {
    final rawSession = await _storage.read(key: _sessionKey);

    if (rawSession == null) {
      return null;
    }

    return AuthSessionModel.fromJson(
      jsonDecode(rawSession) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveSession(AuthSessionModel session) async {
    await _storage.write(key: _sessionKey, value: jsonEncode(session.toJson()));
  }

  @override
  Future<void> removeSession() async {
    await _storage.delete(key: _sessionKey);
  }
}
