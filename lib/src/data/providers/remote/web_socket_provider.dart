import 'dart:async';

import 'package:faker/faker.dart';
import 'package:ui_tests_units/src/data/models/app_notifications.dart';

class WebSocketProvider {
  WebSocketProvider() {
    _init();
  }

  StreamController<AppNotifications> _controller = StreamController.broadcast();
  Stream<AppNotifications> get onNotification => _controller.stream;
  Timer? _timer;

  void _init() {
    _timer = Timer.periodic(
      Duration(minutes: 1),
      (_) {
        final faker = Faker();
        final notification = AppNotifications(
          id: DateTime.now().microsecondsSinceEpoch,
          title: "${faker.lorem.word()} ${faker.lorem.word()}",
          description: faker.lorem.sentence(),
          content: {},
          createdAt: DateTime.now(),
        );
        _controller.sink.add(notification);
      },
    );
  }

  Future<void> connect(String uri) async {
    await Future.delayed(Duration(seconds: 3));
  }

  Future<void> disconnect() async {
    _timer?.cancel();
    await _controller.close();
    await Future.delayed(Duration(seconds: 2));
  }
}
