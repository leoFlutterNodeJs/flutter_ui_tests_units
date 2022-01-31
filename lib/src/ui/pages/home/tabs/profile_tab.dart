import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/repositories/repositories.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/routes/routes.dart';
import 'package:ui_tests_units/src/ui/global_controllers/global_controllers.dart';
import 'package:ui_tests_units/src/utils/dialogs.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  void _signOut(BuildContext context) async {
    final isOk = await Dialogs.confirm(context, title: "Action Required");
    if (isOk!) {
      await Get.i.find<WebSocketRepository>()!.disconnect();
      context.read<NotificationsController>().clear();
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.LOGIN, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Get.i.find<User>();
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(height: 15),
          Align(
            child: ClipOval(
              child: CachedNetworkImage(
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                  imageUrl:
                      "https://www.nj.com/resizer/zovGSasCaR41h_yUGYHXbVTQW2A=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg"),
            ),
          ),
          SizedBox(height: 15),
          CupertinoFormSection.insetGrouped(
            header: Text('User Information'),
            margin: EdgeInsets.all(10).copyWith(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            children: [
              RowProfile(label: "ID", value: "${user!.id}"),
              RowProfile(label: "Nome", value: "${user.name} ${user.lastName}"),
              RowProfile(label: "E-mail", value: "${user.email}"),
              RowProfile(label: "Nascimento", value: "${user.birthday}"),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: Text('Payment methods'),
            margin: EdgeInsets.all(10).copyWith(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            children: [
              RowProfile(label: "Credit Cards", value: "xxxx.xxxx.xxxx.xx89"),
              RowProfile(label: "Paypal", value: "leocardosodev@gmail.com"),
            ],
          ),
          CupertinoFormSection.insetGrouped(
            header: Text('Accounts'),
            margin: EdgeInsets.all(10).copyWith(top: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            children: [
              CupertinoFormRow(
                  prefix: Text(
                    "Sair",
                    style: TextStyle(color: Colors.black),
                  ),
                  child: CupertinoButton(
                    onPressed: () => _signOut(context),
                    child: Text("Log out"),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class RowProfile extends StatelessWidget {
  final String? label, value;
  RowProfile({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: Text(
        label!,
        style: TextStyle(color: Colors.black),
      ),
      child: Text(value!),
    );
  }
}
