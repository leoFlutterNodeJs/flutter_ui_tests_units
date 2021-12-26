import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          Container(
            width: 40,
            height: 10,
            color: Colors.grey,
          ),
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
