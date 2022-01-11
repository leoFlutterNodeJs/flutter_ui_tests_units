import 'package:flutter/material.dart';

class CartTab extends StatefulWidget {
  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (_, index) => Text("CARTS $index"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
