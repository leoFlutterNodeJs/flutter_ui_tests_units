import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/global_widgets/global_widgets.dart';
import 'package:ui_tests_units/src/utils/dialogs.dart';

import '../forgot_password_controller.dart';

class ForgotPasswordForm extends StatelessWidget {
  void _submit(BuildContext context) async {
    final controller = context.read<ForgotPasswordController>();
    ProgressDialog.show(context);
    final sent = await controller.submit();
    Navigator.pop(context);
    if (sent) {
      await Dialogs.alert(
        context,
        title: "GOOD",
        description: "We have sent an email ${controller.email}",
        dismissible: false,
      );
      Navigator.pop(context);
    } else {
      Dialogs.alert(
        context,
        title: "ERROR",
        description: "E-mail ${controller.email} not found!",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          InputText(
            prefixIcon: Icon(Icons.email_outlined),
            labelText: "E-mail",
            onChanged: controller.onEmailChanged,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: RoundedButton(
              label: "Send",
              onPressed: () => _submit(context),
            ),
          ),
        ],
      ),
    );
  }
}
