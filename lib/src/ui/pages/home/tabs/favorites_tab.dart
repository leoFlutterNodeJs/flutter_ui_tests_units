import 'package:flutter/material.dart';

class FavoritesTab extends StatefulWidget {
  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (_, index) => Text("FAVORITES $index"),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
