import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/global_widgets/custom_form.dart';
import 'package:ui_tests_units/src/global_widgets/input_text.dart';
import 'package:ui_tests_units/src/global_widgets/rounded_button.dart';
import 'package:ui_tests_units/src/pages/register/register_controller.dart';
import 'package:ui_tests_units/src/routes/routes.dart';
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
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text("ERROR"),
                  content: Text("Register Fail!"),
                ));
      } else {
        showDialog(
            context: context,
            builder: (_) => WillPopScope(
                  onWillPop: () async => false,
                  child: AlertDialog(
                    title: Text("GOOD"),
                    content: Text("Register OK!"),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.popUntil(context,
                              (route) => route.settings.name == Routes.LOGIN),
                          child: Text("OK"))
                    ],
                  ),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("ERROR"),
                content: Text("Invalid Fields"),
              ));
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
