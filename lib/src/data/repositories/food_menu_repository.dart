import 'package:ui_tests_units/src/data/models/dish.dart';

abstract class FoodMenuRepository {
  Future<List<Dish>> getPopularMenu();
}
