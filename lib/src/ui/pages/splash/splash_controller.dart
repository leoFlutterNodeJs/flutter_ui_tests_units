import 'package:flutter/widgets.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/repositories/preferences_repository.dart';
import 'package:ui_tests_units/src/data/repositories/repositories.dart';
import 'package:ui_tests_units/src/helpers/get.dart';

class SplashController extends ChangeNotifier {
  final _preferencesRepository = Get.i.find<PreferencesRepository>();
  final _authenticationRepository = Get.i.find<AuthenticationRepository>();
  final _accountUserRepository = Get.i.find<AccountUserRepository>();

  void Function(User? user, bool isReady)? onAfterFirstLayout;

  void afterFirstLayout() async {
    Future.delayed(Duration(seconds: 1));
    final String? token = _authenticationRepository?.token;
    if (token != null) {
      final user = await _accountUserRepository?.userAccount;
      if (user != null) {
        if (onAfterFirstLayout != null) {
          onAfterFirstLayout!(user, true);
          return;
        }
      }
    }
    final ready = _preferencesRepository!.onBoardAndWelcomeReady;
    if (onAfterFirstLayout != null) {
      onAfterFirstLayout!(null, ready);
    }
  }
}
