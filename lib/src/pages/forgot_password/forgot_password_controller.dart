import 'package:flutter/widgets.dart';
import 'package:ui_tests_units/src/data/repositories/authentication_repository.dart';
import 'package:ui_tests_units/src/helpers/get.dart';

class ForgotPasswordController extends ChangeNotifier {
  String _email = "";

  String get email => _email;

  final AuthenticationRepository _repository =
      Get.i.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  Future<bool> submit() async {
    return _repository.sendResetToken(_email);
  }
}
