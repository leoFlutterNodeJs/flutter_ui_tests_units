import 'package:ui_tests_units/src/data/models/user.dart';

class AuthenticationProvider {
  Future<User> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 3));
    if (email == "leocardosodev@gmail.com" && password == "123456") {
      return User(
          id: "12345",
          email: 'leocardosodev@gmail.com',
          name: 'Leonardo',
          lastName: 'Silva',
          birthday: DateTime(1982, 1, 1));
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
