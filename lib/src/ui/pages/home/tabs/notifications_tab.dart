import 'package:flutter/material.dart';

class NotificationsTab extends StatefulWidget {
  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (_, index) => Text("NOTIFICATIONS $index"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
