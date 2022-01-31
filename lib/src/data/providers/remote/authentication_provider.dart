import 'package:ui_tests_units/src/data/models/user.dart';

class AuthenticationProvider {
  Future<String?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    final String token = DateTime.now().microsecondsSinceEpoch.toString();
    if (email == "leocardosodev@gmail.com" && password == "123456") {
      return token;
    }
    return null;
  }

  Future<bool> register(User user) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  Future<bool> sendResetToken(String email) async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }
}
