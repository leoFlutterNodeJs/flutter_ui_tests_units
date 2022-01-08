import 'package:flutter/cupertino.dart';
import 'package:ui_tests_units/src/routes/routes.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:provider/provider.dart';

import '../onboard_controller.dart';
import 'onboard_dots.dart';

class OnboardControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OnboardDots(),
          Consumer<OnboardController>(
            builder: (_, controller, __) => CupertinoButton(
              onPressed: () {
                controller.currentPage == 2
                    ? Navigator.pushReplacementNamed(context, Routes.WELCOME)
                    : controller.pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
              },
              color: primaryColor,
              borderRadius: BorderRadius.circular(30),
              child:
                  Text(controller.currentPage == 2.0 ? "Get Started" : "Next"),
            ),
          ),
        ],
      ),
    );
  }
}
