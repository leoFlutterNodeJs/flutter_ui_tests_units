import 'package:ui_tests_units/src/data/implementation/authentication_respository_implementation.dart';
import 'package:ui_tests_units/src/data/implementation/food_menu_repository_implementation.dart';
import 'package:ui_tests_units/src/data/providers/remote/authentication_provider.dart';
import 'package:ui_tests_units/src/data/providers/remote/food_menu_provider.dart';
import 'package:ui_tests_units/src/data/repositories/authentication_repository.dart';
import 'package:ui_tests_units/src/data/repositories/food_menu_repository.dart';

import 'get.dart';

abstract class DependencyInjection {
  static void initialize() {
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(AuthenticationProvider());
    final FoodMenuRepositoryImplementation foodMenuRepository =
        FoodMenuRepositoryImplementation(FoodMenuProvider());
    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<AuthenticationRepository>(authenticationRepository);
  }
}
