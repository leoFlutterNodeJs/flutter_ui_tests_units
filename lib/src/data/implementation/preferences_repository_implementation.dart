import 'package:ui_tests_units/src/data/providers/local/preferences_provider.dart';
import 'package:ui_tests_units/src/data/repositories/preferences_repository.dart';

class PreferencesRepositoryImplementation implements PreferencesRepository {
  final PreferencesProvider _provider;
  PreferencesRepositoryImplementation(this._provider);
  @override
  bool get onBoardAndWelcomeReady => _provider.onBoardAndWelcomeReady;

  @override
  Future<void> setOnBoardAndWelcomeReady(bool ready) {
    return _provider.setOnBoardAndWelcomeReady(ready);
  }
}
