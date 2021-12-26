import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/pages/onboard/onboard_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class OnboardDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context);
    return Container(
      child: Row(
        children: List.generate(
            controller.items.length,
            (index) => Container(
                  margin: EdgeInsets.only(right: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: controller.currentPage == index
                          ? primaryColor
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: primaryColor,
                      )),
                )),
      ),
    );
  }
}
