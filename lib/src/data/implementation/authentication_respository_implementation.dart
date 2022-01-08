import '../providers/authentication_provider.dart';
import '../repositories/authentication_repository.dart';
import '../models/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationProvider _authenticationProvider;

  AuthenticationRepositoryImpl(this._authenticationProvider);

  @override
  Future<User> login(String email, String password) {
    return _authenticationProvider.login(email, password);
  }

  @override
  Future<bool> register(User user) {
    return _authenticationProvider.register(user);
  }

  @override
  Future<bool> sendResetToken(String email) {
    return null;
  }
}
