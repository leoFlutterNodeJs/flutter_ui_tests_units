import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/helpers/dependency_injection.dart';

import './ui/global_controllers/global_controllers.dart';
import './utils/font_styles.dart';
import '../src/utils/colors.dart';
import './routes/pages.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    DependencyInjection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartController>(create: (_) => CartController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.light(secondary: primaryColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: FontStyles.TextTheme,
          cupertinoOverrideTheme: CupertinoThemeData(
            primaryColor: primaryColor,
            textTheme: CupertinoTextThemeData(
              textStyle: FontStyles.textButton,
              primaryColor: primaryColor,
            ),
          ),
        ),
        routes: Pages.routes,
        initialRoute: Pages.INITIAL,
      ),
    );
  }
}
