import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/implementation/authentication_respository_implementation.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/providers/authentication_provider.dart';
import 'package:ui_tests_units/src/data/repositories/authentication_repository.dart';

class LoginController extends ChangeNotifier {
  String _email = "", _password = "";
  final AuthenticationRepository _repository =
      AuthenticationRepositoryImpl(AuthenticationProvider());

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<User> submit() {
    return _repository.login(_email, _password);
  }
}
