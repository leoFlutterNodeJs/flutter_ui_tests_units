import 'package:flutter/widgets.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';

class DishController extends ChangeNotifier {
  final Dish dish;
  VoidCallback onDispose;
  DishController(this.dish);

  @override
  void dispose() {
    if (onDispose != null) onDispose();
    super.dispose();
  }
}
