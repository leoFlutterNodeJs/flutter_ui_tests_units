import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/ui/pages/home/tabs/favorites_tab/widgets/favorite_item.dart';

class FavoritesTab extends StatefulWidget {
  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favorites = context
        .select<HomeController, Map<int?, Dish>>((_) => _.favorites)
        .values
        .toList();
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (_, index) => FavoriteItem(dish: favorites[index]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
