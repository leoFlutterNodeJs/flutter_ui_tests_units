import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ui/global_controllers/global_controllers.dart';
import './utils/font_styles.dart';
import '../src/utils/colors.dart';
import './routes/pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartController>(create: (_) => CartController()),
        ChangeNotifierProvider<NotificationsController>(
            create: (_) => NotificationsController()),
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
