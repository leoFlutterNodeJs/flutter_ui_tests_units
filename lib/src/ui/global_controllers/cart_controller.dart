import 'package:flutter/widgets.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';

class CartController extends ChangeNotifier {
  Map<int, Dish> _cart = {};
  Map<int, Dish> get cart => _cart;

  bool isInCart(Dish dish) {
    return _cart.containsKey(dish.id);
  }

  bool get hasItem => _cart.length > 0;

  int getDishCounter(Dish dish) {
    if (isInCart(dish)) {
      return _cart[dish.id].counter;
    }
    return 0;
  }

  void addToCart(Dish dish, {bool update = true}) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    copy[dish.id] = dish;
    _cart = copy;
    if (update) {
      notifyListeners();
    }
  }

  void deleteFromCart(Dish dish) {
    Map<int, Dish> copy = Map<int, Dish>.from(_cart);
    if (copy.containsKey(dish.id)) {
      copy.remove(dish.id);
      _cart = copy;
      notifyListeners();
    }
  }

  double get subtotal => cart.values
      .map((e) => e.price * e.counter)
      .toList()
      .reduce((v, e) => v + e);
  double get delivery => 15.55;
  double get total => subtotal + delivery;
}
