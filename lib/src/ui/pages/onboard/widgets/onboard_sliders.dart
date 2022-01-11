import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/onboard_items.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

import '../onboard_controller.dart';

class OnboardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);
    return Expanded(
      child: PageView(
        controller: controller.pageController,
        children: List.generate(
          controller.items.length,
          (index) {
            final OnboardItems item = controller.items[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(child: SvgPicture.asset(item.image)),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: FontStyles.title,
                  ),
                  SizedBox(height: 15),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
