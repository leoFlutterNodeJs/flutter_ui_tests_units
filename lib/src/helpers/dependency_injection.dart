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

    final authenticationLocalProvider =
        AuthenticationLocalProvider(preferences);
    final authenticationRepository = AuthenticationRepositoryImpl(
        AuthenticationProvider(), AuthenticationLocalProvider(preferences));
    final accountUserRepository = AccountUserRepositoryImplementation(
        AccountUserProvider(authenticationLocalProvider));

    final foodMenuRepository =
        FoodMenuRepositoryImplementation(FoodMenuProvider());

    final preferencesProvider = PreferencesProvider(preferences);
    final preferencesRepository =
        PreferencesRepositoryImplementation(preferencesProvider);

    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<PreferencesRepository>(preferencesRepository);
    Get.i.put<AccountUserRepository>(accountUserRepository);
    Get.i.put<String>("API_KEY", tag: "apiKey");
    Get.i.lazyPut<WebSocketRepository>(() {
      final webSocketProvider = WebSocketProvider();
      final webSocketRepository =
          WebSocketRepositoryImplementation(webSocketProvider);
      return webSocketRepository;
    });

    final VoidCallback dispose = () {
      //// webSocketProvider.dispose();
    };

    Get.i.put<VoidCallback>(dispose, tag: "dispose");
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: "dispose");
    dispose!();
  }
}
