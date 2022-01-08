import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/routes/routes.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text("Don't have an account?"),
        SizedBox(width: 5),
        CupertinoButton(
          padding: EdgeInsets.zero,
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, Routes.REGISTER),
        )
      ],
    );
  }
}
