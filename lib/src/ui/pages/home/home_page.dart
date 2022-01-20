import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import './tabs/tabs.dart';
import './widgets/home_bottom_bar.dart';
import 'widgets/cart_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      final controller = HomeController();
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        controller.afterFirstLayout();
      });
      Get.i.put<HomeController>(controller);
      controller.onDispose = () => Get.i.remove<HomeController>();
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
              ProfileTab(),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomBar(),
        floatingActionButton: CartButton(),
      );
    });
  }
}
