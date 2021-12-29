import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class RoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color textColor, backgroundColor, borderColor;
  RoundedButton({
    @required this.label,
    @required this.onPressed,
    this.textColor = Colors.white,
    this.backgroundColor = primaryColor,
    this.borderColor = primaryColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: this.borderColor),
      ),
      child: CupertinoButton(
        minSize: 30,
        onPressed: this.onPressed,
        color: backgroundColor,
        padding: EdgeInsets.zero,
        child: Text(
          this.label,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
