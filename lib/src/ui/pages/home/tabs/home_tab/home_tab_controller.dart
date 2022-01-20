import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/category.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/data/repositories/food_menu_repository.dart';
import 'package:ui_tests_units/src/helpers/get.dart';

class HomeTabController extends ChangeNotifier {
  final FoodMenuRepository? _foodMenuRepository =
      Get.i.find<FoodMenuRepository>();
  final List<Category> categories = [
    Category(
        iconPath: "assets/svg/tab_icons/breakfast.svg", label: "Breakfast"),
    Category(iconPath: "assets/svg/tab_icons/dessert.svg", label: "Dessert"),
    Category(iconPath: "assets/svg/tab_icons/dinner.svg", label: "Dinner"),
    Category(iconPath: "assets/svg/tab_icons/fries.svg", label: "Friess"),
  ];

  List<Dish> _popularMenu = [];
  List<Dish> get popularMenu => _popularMenu;

  void afterFirstLayout() {
    _init();
  }

  void _init() async {
    _popularMenu = await _foodMenuRepository!.getPopularMenu();
    notifyListeners();
  }
}
