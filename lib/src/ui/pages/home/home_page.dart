import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import './tabs/tabs.dart';
import './widgets/home_bottom_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      final controller = HomeController();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.afterFirstLayout();
      });
      return controller;
    }, builder: (_, __) {
      final controller = Provider.of<HomeController>(_, listen: false);
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: TabBarView(
            controller: controller.tabController,
            children: [
              HomeTab(),
              FavoritesTab(),
              NotificationsTab(),
              CartTab(),
              ProfileTab(),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomBar(),
      );
    });
  }
}
