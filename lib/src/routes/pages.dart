import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/pages/welcome/welccome_page.dart';

import '../pages/onboard/onboard_page.dart';
import 'routes.dart';

abstract class Pages {
  static const String INITIAL = Routes.ONBOARD;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => OnboardPage(),
    Routes.WELCOME: (_) => WelcomePage(),
  };
}
