import 'package:flutter/material.dart';

import '../pages/pages.dart';
import 'routes.dart';

abstract class Pages {
  static const String INITIAL = Routes.ONBOARD;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => OnboardPage(),
    Routes.WELCOME: (_) => WelcomePage(),
    Routes.LOGIN: (_) => LoginPage(),
  };
}
