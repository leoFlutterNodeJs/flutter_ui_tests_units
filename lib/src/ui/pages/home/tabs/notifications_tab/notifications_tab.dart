import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/global_controllers/global_controllers.dart';
import 'package:ui_tests_units/src/ui/pages/home/tabs/notifications_tab/widgets/notification_item.dart';

class NotificationsTab extends StatefulWidget {
  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NotificationsController>();
    final notifications = controller.notifications;
    super.build(context);
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (_, index) =>
          NotificationItem(notifications: notifications[index]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
