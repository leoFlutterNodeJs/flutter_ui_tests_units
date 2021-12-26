import 'package:flutter/material.dart';

import '../pages/onboard/onboard_page.dart';
import 'routes.dart';

abstract class Pages {
  static const String INITIAL = Routes.ONBOARD;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => OnboardPage(),
  };
}
