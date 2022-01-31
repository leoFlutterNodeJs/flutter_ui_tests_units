import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/repositories/repositories.dart';
import 'package:ui_tests_units/src/helpers/get.dart';

class LoginController extends ChangeNotifier {
  String _email = "", _password = "";
  final _repository = Get.i.find<AuthenticationRepository>();
  final _userRepository = Get.i.find<AccountUserRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<User?> submit() async {
    final String? token = await _repository!.login(_email, _password);
    if (token != null) {
      await _repository!.saveToken(token);
      return _userRepository!.userAccount;
    }
    return null;
  }
}
