import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/pages/dish/widgets/dish_counter.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

import '../dish_controller.dart';

class DishDetail extends StatelessWidget {
  void _toogleFavorite(BuildContext context) {
    final homeController = Get.i.find<HomeController>();
    final controller = context.read<DishController>();
    homeController.toogleFavorites(controller.dish);
    controller.toogleFavorite();
    if (controller.isFavorite) {
      final SnackBar snackbar = SnackBar(
          backgroundColor: primaryColor,
          duration: Duration(milliseconds: 100),
          content: Text(
            "Added to Favorite",
            textAlign: TextAlign.center,
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DishController>(context);
    final dish = controller.dish;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dish.name, style: FontStyles.title),
                    Text("R\$ ${dish.price}"),
                  ],
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.all(10),
                onPressed: () => _toogleFavorite(context),
                child: SvgPicture.asset(
                  "assets/svg/icons/favorite.svg",
                  width: 30,
                  color: controller.isFavorite ? primaryColor : Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          DishCounter(
            onChanged: controller.onCounterChanged,
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(dish.description),
          ),
        ],
      ),
    );
  }
}
