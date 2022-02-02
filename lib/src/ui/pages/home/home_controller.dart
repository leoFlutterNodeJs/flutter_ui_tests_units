import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/bottom_item_bar.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/data/repositories/repositories.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/global_controllers/global_controllers.dart';

class HomeController extends ChangeNotifier {
  final NotificationsController notificationsController;
  HomeController(this.notificationsController);

  final _webSocketRepository = Get.i.find<WebSocketRepository>(lazy: true);

  int _currentPage = 0;
  int get currentPage => _currentPage;

  Map<int?, Dish> _favorites = {};
  Map<int?, Dish> get favorites => _favorites;

  bool isFavorite(Dish dish) => _favorites.containsKey(dish.id);

  void Function()? onDispose;

  final TabController tabController =
      TabController(length: 4, vsync: NavigatorState());

  StreamSubscription? _notificationSubscription;

  void afterFirstLayout() {
    _webSocketRepository!.connect("https://websocket.demo");
    _notificationSubscription = this
        .notificationsController
        .onNotificationsChanged
        .listen((notifications) {
      final int count = notifications.length;
      List<BottomBarItem> copy = [..._items];
      copy[2] = copy[2].copyWith(badgeCount: count);
      _items = copy;
      notifyListeners();
    });
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  void toogleFavorites(Dish dish) {
    Map<int?, Dish> copy = Map<int?, Dish>.from(_favorites);
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

  List<BottomBarItem> _items = [
    BottomBarItem(icon: 'assets/svg/icons/home.svg', label: "Home"),
    BottomBarItem(icon: 'assets/svg/icons/favorite.svg', label: "Favorites"),
    BottomBarItem(icon: 'assets/svg/icons/bell.svg', label: "Notificatons"),
    BottomBarItem(icon: 'assets/svg/icons/avatar.svg', label: "Profile"),
  ];

  List<BottomBarItem> get items => _items;

  @override
  void dispose() async {
    this._notificationSubscription?.cancel();
    this.tabController.dispose();
    if (onDispose != null) this.onDispose!();
    await _webSocketRepository!.disconnect();
    super.dispose();
  }
}
