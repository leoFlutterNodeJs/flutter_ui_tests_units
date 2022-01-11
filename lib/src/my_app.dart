import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

import '../src/utils/colors.dart';
import './routes/pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
