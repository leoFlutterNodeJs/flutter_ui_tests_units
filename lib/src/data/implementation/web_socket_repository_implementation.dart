import 'package:ui_tests_units/src/data/models/app_notifications.dart';
import 'package:ui_tests_units/src/data/providers/remote/web_socket_provider.dart';
import 'package:ui_tests_units/src/data/repositories/web_socket_repository.dart';

class WebSocketRepositoryImplementation implements WebSocketRepository {
  final WebSocketProvider _provider;
  WebSocketRepositoryImplementation(this._provider);
  @override
  Future<void> connect(String uri) {
    return _provider.connect(uri);
  }

  @override
  Stream<AppNotifications> get onNotification => _provider.onNotification;

  @override
  Future<void> disconnect() {
    return _provider.disconnect();
  }
}
