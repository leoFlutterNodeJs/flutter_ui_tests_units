import 'package:ui_tests_units/src/data/providers/local/autentication_local_provider.dart';

import '../providers/remote/authentication_provider.dart';
import '../repositories/authentication_repository.dart';
import '../models/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationProvider _authenticationProvider;
  final AuthenticationLocalProvider _authenticationLocalProvider;

  AuthenticationRepositoryImpl(
      this._authenticationProvider, this._authenticationLocalProvider);

  @override
  Future<String?> login(String email, String password) {
    return _authenticationProvider.login(email, password);
  }

  @override
  Future<bool> register(User user) {
    return _authenticationProvider.register(user);
  }

  @override
  Future<bool> sendResetToken(String email) {
    return _authenticationProvider.sendResetToken(email);
  }

  @override
  Future<void> saveToken(String token) {
    return _authenticationLocalProvider.saveToken(token);
  }

  @override
  String? get token => _authenticationLocalProvider.token;

  @override
  Future<void> removeToken() {
    return _authenticationLocalProvider.removeToken();
  }
}
