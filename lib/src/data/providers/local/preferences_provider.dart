import 'package:shared_preferences/shared_preferences.dart';

const String _key = "OnBoardAndWelcomeReady";

class PreferencesProvider {
  SharedPreferences _preferences;
  PreferencesProvider(this._preferences);

  Future<void> setOnBoardAndWelcomeReady(bool ready) async {
    await _preferences.setBool(_key, ready);
  }

  bool get onBoardAndWelcomeReady {
    return _preferences.getBool(_key) ?? false;
  }
}
