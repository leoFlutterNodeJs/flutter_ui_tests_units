import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/routes/routes.dart';
import 'package:ui_tests_units/src/ui/global_widgets/global_widgets.dart';
import 'package:ui_tests_units/src/utils/dialogs.dart';

import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<LoginController>();
    ProgressDialog.show(context);
    final User user = await controller.submit();
    Navigator.pop(context);
    if (user == null) {
      Dialogs.alert(context,
          title: "ERROR", description: "Invalid email or password");
    } else {
      Get.i.put<User>(user);
      Navigator.pushNamedAndRemoveUntil(context, Routes.HOME, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 350),
      child: Column(
        children: [
          InputText(
            labelText: "E-mail",
            prefixIcon: Icon(Icons.email_outlined),
            validator: (text) {
              if (text.contains("@")) {
                return null;
              }
              return "Invalid E-mail!";
            },
            onChanged: controller.onEmailChanged,
            textInputAction: TextInputAction.continueAction,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 15),
          InputText(
            labelText: "Password",
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
            validator: (text) {
              if (text.length > 4) {
                return null;
              }
              return "Invalid Password!";
            },
            onChanged: controller.onPasswordChanged,
            onSubmitted: (text) => _submit(context),
            textInputAction: TextInputAction.done,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.FORGOT_PASSWORD),
              child: Text('Forget Password'),
            ),
          ),
          SizedBox(height: 10),
          RoundedButton(
            onPressed: () => _submit(context),
            label: "Login",
          ),
        ],
      ),
    );
  }
}
