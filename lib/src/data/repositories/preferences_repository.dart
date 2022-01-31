abstract class PreferencesRepository {
  Future<void> setOnBoardAndWelcomeReady(bool ready);
  bool get onBoardAndWelcomeReady;
}
