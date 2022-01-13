import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';

class HomeController extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  Map<int, Dish> _favorites = {};
  Map<int, Dish> get favorites => _favorites;
  bool isFavorite(Dish dish) => _favorites.containsKey(dish.id);

  void Function() onDispose;

  final TabController tabController =
      TabController(length: 5, vsync: NavigatorState());

  void afterFirstLayout() {
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  void toogleFavorites(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
    } else {
      copy[dish.id] = dish;
    }
    _favorites = copy;
    notifyListeners();
  }

  void deleteFavorite(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_favorites);
    if (isFavorite(dish)) {
      copy.remove(dish.id);
      _favorites = copy;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    this.tabController?.dispose();
    if (onDispose != null) this.onDispose();
    super.dispose();
  }
}
