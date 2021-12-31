import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  String email = "", password = "";

  void onEmailChanged(String text) {
    this.email = text;
  }

  void onPasswordChanged(String text) {
    this.password = text;
  }

  void submit() {}
}
