import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context, {
    String? title,
    String? description,
    String okText = "OK",
    bool dismissible = true,
  }) async {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => WillPopScope(
        onWillPop: () async => dismissible,
        child: CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: description != null ? Text(description) : null,
          actions: [
            CupertinoDialogAction(
                onPressed: () => Navigator.pop(context), child: Text(okText)),
          ],
        ),
      ),
    );
  }

  static Future<bool?> confirm(
    BuildContext context, {
    String? title,
    String? description,
    String okText = "Confirm",
  }) async {
    final result = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(_, true),
              child: Text(okText),
            ),
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(_, false),
              child: Text("Cancel"),
              isDestructiveAction: true,
            ),
          ],
          title: title != null ? Text(title) : null,
          message: description != null ? Text(description) : null,
        ),
      ),
    );
    return result ?? false;
  }
}

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (_) => WillPopScope(
              onWillPop: () async => false,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                color: Colors.white30,
                child: CupertinoActivityIndicator(),
              ),
            ));
  }
}
