import '../models/user.dart';

abstract class AuthenticationRepository {
  Future<String?> login(String email, String password);
  Future<bool> register(User user);
  Future<bool> sendResetToken(String email);
  Future<void> saveToken(String token);
  Future<void> removeToken();
  String? get token;
}
