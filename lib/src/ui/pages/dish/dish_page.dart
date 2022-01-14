import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/pages/dish/widgets/add_to_cart.dart';
import 'package:ui_tests_units/src/ui/pages/dish/widgets/dish_detail.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';

import './dish_controller.dart';
import 'widgets/dish_header.dart';

class DishPage extends StatelessWidget {
  void _setStatusBar(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final DishPageArguments args =
            ModalRoute.of(context).settings.arguments;
        final homeController = Get.i.find<HomeController>();
        final isFavorite = homeController.isFavorite(args.dish);
        final controller = DishController(args, isFavorite);
        _setStatusBar(SystemUiOverlayStyle.light);
        controller.onDispose = () => _setStatusBar(SystemUiOverlayStyle.dark);
        return controller;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: AddToCart(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DishHeader(),
                DishDetail(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
