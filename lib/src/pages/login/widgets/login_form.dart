import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/global_widgets/global_widgets.dart';
import 'package:ui_tests_units/src/pages/login/login_controller.dart';
import 'package:ui_tests_units/src/utils/dialogs.dart';

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
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("ERROR: "),
                content: Text("Invalid email or password"),
              ));
    } else {
      print("GOT TO HOME!");
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
              onPressed: () {},
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
