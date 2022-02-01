import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/providers/local/autentication_local_provider.dart';

class AccountUserProvider {
  final AuthenticationLocalProvider _authenticationLocalProvider;
  AccountUserProvider(this._authenticationLocalProvider);

  Future<User?> get userAccount async {
    final String? token = _authenticationLocalProvider.token;
    if (token == null) throw Exception("Token is null");
    await Future.delayed(Duration(seconds: 2));
    return User(
        id: "12345",
        email: 'leocardosodev@gmail.com',
        name: 'Leonardo',
        lastName: 'Silva',
        birthday: DateTime(1982, 1, 9));
  }
}
