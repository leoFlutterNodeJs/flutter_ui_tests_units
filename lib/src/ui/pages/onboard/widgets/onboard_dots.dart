import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../onboard_controller.dart';

class OnboardDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context);
    return DotsIndicator(
      dotsCount: controller.items.length,
      position: controller.currentPage,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(11.0, 9.0),
        color: Colors.grey.withOpacity(.5),
        activeColor: primaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
