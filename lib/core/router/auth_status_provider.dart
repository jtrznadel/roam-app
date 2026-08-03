abstract class AuthStatusProvider {
  bool get isBootstrapping;

  bool get isAuthenticated;

  Stream<dynamic> get stream;
}
