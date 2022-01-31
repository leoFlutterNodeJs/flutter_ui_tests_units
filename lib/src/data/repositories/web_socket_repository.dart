import '../models/app_notifications.dart';

abstract class WebSocketRepository {
  Future<void> connect(String uri);
  Future<void> disconnect();
  Stream<AppNotifications> get onNotification;
}
