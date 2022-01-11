import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

import './widgets/forgot_password_form.dart';
import 'forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ForgotPasswordController(),
        builder: (_, __) {
          final MediaQueryData data = MediaQuery.of(_);
          final Size size = data.size;
          final padding = data.padding;
          final AppBar appBar = AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          );
          return Scaffold(
            appBar: appBar,
            body: SafeArea(
              child: SingleChildScrollView(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    height: size.height -
                        padding.top -
                        padding.bottom -
                        appBar.preferredSize.height,
                    child: Column(
                      children: [
                        Text('Forgot Password',
                            style: FontStyles.title.copyWith(fontSize: 22)),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 30),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 35),
                        SvgPicture.asset(
                          "assets/svg/forgot_password.svg",
                          height: 250,
                        ),
                        SizedBox(height: 25),
                        ForgotPasswordForm(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
