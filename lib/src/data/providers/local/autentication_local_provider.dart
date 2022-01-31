import 'package:shared_preferences/shared_preferences.dart';

const String _key = "token";

class AuthenticationLocalProvider {
  SharedPreferences _preferences;
  AuthenticationLocalProvider(this._preferences);

  Future<void> saveToken(String token) async {
    await _preferences.setString(_key, token);
  }

  Future<void> removeToken() async {
    await _preferences.remove(_key);
  }

  String? get token => _preferences.getString(_key);
}
