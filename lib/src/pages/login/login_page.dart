import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/pages/login/login_controller.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';
import 'package:ui_tests_units/src/utils/social_buttons.dart';

import 'widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  height: size.height - padding.top - padding.bottom,
                  child: Column(
                    children: [
                      Text(
                        'Welcome Back!',
                        style: FontStyle.title.copyWith(fontSize: 22),
                      ),
                      Expanded(child: SvgPicture.asset("assets/svg/login.svg")),
                      LoginForm(),
                      SizedBox(height: 10),
                      Center(child: Text("Login via OTP")),
                      SizedBox(height: 5),
                      SocialButtons(),
                      SignUp(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
