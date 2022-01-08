import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/global_widgets/custom_form.dart';
import 'package:ui_tests_units/src/global_widgets/input_text.dart';
import 'package:ui_tests_units/src/global_widgets/rounded_button.dart';
import 'package:ui_tests_units/src/pages/register/register_controller.dart';
import 'package:ui_tests_units/src/utils/dialogs.dart';

class RegisterForm extends StatelessWidget {
  void _submit(BuildContext context) async {
    final controller = context.read<RegisterController>();
    final isFormOk = controller.formKey.currentState.validate();

    if (isFormOk) {
      ProgressDialog.show(context);
      final isOk = await controller.submit();
      Navigator.pop(context);
      if (!isOk) {
        Dialogs.alert(context, title: "ERROR", description: "Register Fail!");
      } else {
        await Dialogs.alert(context,
            title: "GOOD",
            description: "Register OK!",
            dismissible: false,
            okText: "Go to login");
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(context, title: "ERROR", description: "Invalid Fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();
    return CustomForm(
      key: controller.formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            InputText(
              labelText: "Name",
              prefixIcon: Icon(Icons.person_outlined),
              onChanged: controller.onNameChanged,
              validator: (text) {
                if (text.trim().length > 2) return null;
                return "Invalid name";
              },
            ),
            SizedBox(height: 10),
            InputText(
              labelText: "Lastname",
              prefixIcon: Icon(Icons.person_pin),
              onChanged: controller.onLastNameChanged,
              validator: (text) {
                if (text.trim().length > 2) return null;
                return "Invalid name";
              },
            ),
            SizedBox(height: 10),
            InputText(
              labelText: "E-mail",
              textInputType: TextInputType.emailAddress,
              prefixIcon: Icon(Icons.email),
              onChanged: controller.onEmailChanged,
              validator: (text) {
                if (text.contains("@")) return null;
                return "Invalid E-mail";
              },
            ),
            SizedBox(height: 25),
            Align(
              alignment: Alignment.centerRight,
              child: RoundedButton(
                label: "Sign Up",
                onPressed: () => _submit(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
