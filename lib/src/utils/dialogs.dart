import 'package:flutter/material.dart';

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              color: Colors.white30,
              child: CircularProgressIndicator(),
            ));
  }
}
