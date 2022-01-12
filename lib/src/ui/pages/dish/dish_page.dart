import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import './dish_controller.dart';

class DishPage extends StatelessWidget {
  void _setStatusBar(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final Dish dish = ModalRoute.of(context).settings.arguments;
        final controller = DishController(dish);
        _setStatusBar(SystemUiOverlayStyle.light);
        controller.onDispose = () => _setStatusBar(SystemUiOverlayStyle.dark);
        return controller;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 6,
                  child: Builder(
                    builder: (context) {
                      final controller =
                          Provider.of<DishController>(context, listen: false);
                      return CachedNetworkImage(
                        imageUrl: controller.dish.preview,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
