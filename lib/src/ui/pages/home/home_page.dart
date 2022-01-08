import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import './widgets/home_bottom_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeController(),
        builder: (_, __) {
          return Scaffold(
            bottomNavigationBar: HomeBottomBar(),
          );
        });
  }
}
