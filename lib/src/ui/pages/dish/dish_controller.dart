import 'package:flutter/widgets.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';

class DishPageArguments {
  final Dish dish;
  final String tag;

  DishPageArguments({
    @required this.dish,
    @required this.tag,
  });
}

class DishController extends ChangeNotifier {
  final Dish dish;
  final String tag;
  VoidCallback onDispose;
  DishController(DishPageArguments arguments)
      : this.dish = arguments.dish,
        this.tag = arguments.tag;

  int _counter = 0;
  int get counter => _counter;

  void onCounterChanged(int counter) {
    _counter = counter;
  }

  @override
  void dispose() {
    if (onDispose != null) onDispose();
    super.dispose();
  }
}
