import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:ui_tests_units/src/pages/login/widgets/widgets.dart';
import 'package:ui_tests_units/src/routes/routes.dart';
import 'package:ui_tests_units/src/utils/social_buttons.dart';

import '../../../src/utils/font_styles.dart';
import '../../global_widgets/global_widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SvgPicture.asset('assets/svg/welcome.svg')),
              SizedBox(height: 10),
              Text("Welcome", style: FontStyle.title),
              SizedBox(height: 10),
              Text(
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: RoundedButton(
                    label: 'Login',
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, Routes.LOGIN),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                    child: RoundedButton(
                      label: 'Sign Up',
                      onPressed: () {},
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Text("Or social media"),
              SizedBox(height: 5),
              SocialButtons(),
              SizedBox(height: 5),
              SignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
