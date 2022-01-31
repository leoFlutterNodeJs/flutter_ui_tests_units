import 'package:flutter/material.dart';

import '../ui/pages/pages.dart';
import 'routes.dart';

abstract class Pages {
  static const String INITIAL = Routes.SPLASH;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => OnboardPage(),
    Routes.WELCOME: (_) => WelcomePage(),
    Routes.LOGIN: (_) => LoginPage(),
    Routes.REGISTER: (_) => RegisterPage(),
    Routes.FORGOT_PASSWORD: (_) => ForgotPassword(),
    Routes.HOME: (_) => HomePage(),
    Routes.DISH: (_) => DishPage(),
    Routes.CART: (_) => CartPage(),
    Routes.SPLASH: (_) => SplashPage(),
  };
}
