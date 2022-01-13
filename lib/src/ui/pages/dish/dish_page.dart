import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/pages/dish/widgets/dish_counter.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';
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
        final controller = DishController(args);
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
                Builder(
                  builder: (_) {
                    final controller = Provider.of<DishController>(_);
                    final dish = controller.dish;
                    return Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                                onPressed: () {},
                                child: SvgPicture.asset(
                                  "assets/svg/icons/favorite.svg",
                                  width: 30,
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
