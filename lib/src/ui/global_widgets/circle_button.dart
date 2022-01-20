import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  CircleButton({required this.onPressed, required this.iconPath});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: this.onPressed,
      child: SvgPicture.asset(iconPath, width: 40),
    );
  }
}
