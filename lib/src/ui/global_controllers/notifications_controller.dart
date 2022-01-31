import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/app_notifications.dart';
import 'package:ui_tests_units/src/data/repositories/repositories.dart';
import 'package:ui_tests_units/src/helpers/get.dart';

class NotificationsController extends ChangeNotifier {
  final _webSocketRepository = Get.i.find<WebSocketRepository>();
  late StreamSubscription _subscription;
  List<AppNotifications> _notifications = [];
  List<AppNotifications> get notifications => _notifications;
  StreamController<List<AppNotifications>> _notificationStreamController =
      StreamController.broadcast();
  Stream<List<AppNotifications>> get onNotificationsChanged =>
      _notificationStreamController.stream;

  NotificationsController() {
    _subscription =
        _webSocketRepository!.onNotification.listen(_onNotificationListener);
  }

  void _onNotificationListener(AppNotifications notification) {
    _notifications = [notification, ...notifications];
    _notificationStreamController.sink.add(_notifications);
    notifyListeners();
  }

  void clear() {
    _notifications = [];
  }

  @override
  void dispose() {
    _notificationStreamController.close();
    _subscription.cancel();
    super.dispose();
  }
}
