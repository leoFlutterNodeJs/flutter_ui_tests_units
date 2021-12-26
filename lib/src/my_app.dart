import 'package:flutter/material.dart';

import '../src/utils/colors.dart';
import './routes/pages.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      routes: Pages.routes,
      initialRoute: Pages.INITIAL,
    );
  }
}
