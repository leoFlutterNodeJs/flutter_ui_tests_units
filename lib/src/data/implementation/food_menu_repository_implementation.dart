import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/data/providers/remote/food_menu_provider.dart';
import 'package:ui_tests_units/src/data/repositories/food_menu_repository.dart';

class FoodMenuRepositoryImplementation implements FoodMenuRepository {
  final FoodMenuProvider _provider;

  FoodMenuRepositoryImplementation(this._provider);

  @override
  Future<List<Dish>> getPopularMenu() {
    return _provider.getPopularMenu();
  }
}
