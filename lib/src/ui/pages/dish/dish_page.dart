import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/pages/dish/widgets/dish_detail.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

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
        floatingActionButton: CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(30),
          color: primaryColor,
          child: Icon(Icons.shopping_cart),
        ),
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
