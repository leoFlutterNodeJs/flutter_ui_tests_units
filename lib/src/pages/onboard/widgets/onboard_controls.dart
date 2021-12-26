import 'package:flutter/cupertino.dart';
import 'package:ui_tests_units/src/pages/onboard/widgets/onboard_dots.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

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
          CupertinoButton(
            onPressed: () {},
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
