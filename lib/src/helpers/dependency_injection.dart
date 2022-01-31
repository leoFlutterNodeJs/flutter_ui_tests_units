import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_tests_units/src/data/implementation/account_user_repository_implementation.dart';
import 'package:ui_tests_units/src/data/implementation/preferences_repository_implementation.dart';
import 'package:ui_tests_units/src/data/providers/local/autentication_local_provider.dart';
import 'package:ui_tests_units/src/data/providers/local/preferences_provider.dart';
import 'package:ui_tests_units/src/data/repositories/preferences_repository.dart';

import '../data/providers/remote/remote.dart';
import '../data/implementation/implementation.dart';
import '../data/repositories/repositories.dart';

import 'get.dart';

typedef VoidCallback = void Function();

abstract class DependencyInjection {
  static Future<void> initialize() async {
    final preferences = await SharedPreferences.getInstance();
    final webSocketProvider = WebSocketProvider();
    final preferencesProvider = PreferencesProvider(preferences);
    final authenticationLocalProvider =
        AuthenticationLocalProvider(preferences);

    final authenticationRepository = AuthenticationRepositoryImpl(
        AuthenticationProvider(), AuthenticationLocalProvider(preferences));
    final foodMenuRepository =
        FoodMenuRepositoryImplementation(FoodMenuProvider());
    final webSocketRepository =
        WebSocketRepositoryImplementation(webSocketProvider);
    final preferencesRepository =
        PreferencesRepositoryImplementation(preferencesProvider);
    final accountUserRepository = AccountUserRepositoryImplementation(
        AccountUserProvider(authenticationLocalProvider));

    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<WebSocketRepository>(webSocketRepository);
    Get.i.put<PreferencesRepository>(preferencesRepository);
    Get.i.put<AccountUserRepository>(accountUserRepository);

    final VoidCallback dispose = () {
      webSocketProvider.dispose();
    };

    Get.i.put<VoidCallback>(dispose, tag: "dispose");
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: "dispose");
    dispose!();
  }
}
