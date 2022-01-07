import '../providers/authentication_provider.dart';
import '../repositories/authentication_repository.dart';
import '../models/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationProvider _authenticationApi;

  AuthenticationRepositoryImpl(this._authenticationApi);

  @override
  Future<User> login(String email, String password) {
    return _authenticationApi.login(email, password);
  }

  @override
  Future<bool> register(User user) {
    return null;
  }

  @override
  Future<bool> sendResetToken(String email) {
    return null;
  }
}
