import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';
import './register_controller.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterController>(
      create: (_) => RegisterController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  constraints: BoxConstraints(
                    minHeight: size.height - padding.top - padding.bottom,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text("Sign Up",
                          style: FontStyle.title.copyWith(fontSize: 22)),
                      SizedBox(height: 5),
                      Text(
                        "Fill the details & create your account",
                      ),
                      SizedBox(height: 65),
                      RegisterForm()
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
