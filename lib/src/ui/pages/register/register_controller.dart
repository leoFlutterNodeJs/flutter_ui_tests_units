import 'package:flutter/widgets.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/repositories/authentication_repository.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/global_widgets/custom_form.dart';

class RegisterController extends ChangeNotifier {
  String _name = "", _lastName = "", _email = "";
  GlobalKey<CustomFormState> formKey = GlobalKey();
  final AuthenticationRepository? _repository =
      Get.i.find<AuthenticationRepository>();

  void onNameChanged(String text) => _name = text;
  void onLastNameChanged(String text) => _lastName = text;
  void onEmailChanged(String text) => _email = text;

  Future<bool> submit() async {
    _repository!.register(User(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: _name,
        lastName: _lastName,
        email: _email,
        birthday: null));
    return true;
  }
}
