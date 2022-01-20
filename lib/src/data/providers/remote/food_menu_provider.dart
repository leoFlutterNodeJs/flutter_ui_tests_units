import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';

class FoodMenuProvider {
  Future<List<Dish>> getPopularMenu() async {
    final jsonAsString =
        await rootBundle.loadString('assets/json/popular_menu.json');
    final List list = jsonDecode(jsonAsString);
    List<Dish> dishes = [];

    for (final Map<String, dynamic> item in list as Iterable<Map<String, dynamic>>) {
      final dish = Dish(
        id: item['id'],
        name: item['name'],
        preview: item['preview'],
        description: item['description'],
        price: double.parse(item['price'].toString()),
        rate: double.parse(item['rate'].toString()),
      );
      dishes.add(dish);
    }
    return dishes;
  }
}
