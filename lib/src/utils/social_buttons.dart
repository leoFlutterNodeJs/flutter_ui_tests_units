import 'package:flutter/cupertino.dart';
import 'package:ui_tests_units/src/ui/global_widgets/circle_button.dart';

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleButton(
              onPressed: () {}, iconPath: "assets/svg/icons/ic_facebook.svg"),
          CircleButton(
              onPressed: () {},
              iconPath: "assets/svg/icons/ic_google_plus.svg"),
          CircleButton(
              onPressed: () {}, iconPath: "assets/svg/icons/ic_apple.svg"),
        ],
      ),
    );
  }
}
