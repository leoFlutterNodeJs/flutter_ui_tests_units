import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/global_widgets/global_widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 350),
      child: Column(
        children: [
          InputText(
            prefixIcon: Icon(Icons.email_outlined),
            validator: (text) => text.contains("@"),
            onChanged: (text) {},
          ),
          InputText(
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
            validator: (text) => text.length > 4,
            onChanged: (text) {},
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
            onPressed: () {},
            label: "Login",
          ),
        ],
      ),
    );
  }
}
