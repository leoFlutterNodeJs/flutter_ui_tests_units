import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/routes/routes.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              RowProfile(label: "ID", value: "1"),
              RowProfile(label: "Nome", value: "Leonardo Silva"),
              RowProfile(label: "E-mail", value: "leocardosodev@gmail.com"),
              RowProfile(label: "Nascimento", value: "09/01/1982"),
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
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context, Routes.LOGIN, (route) => false),
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
  final String label, value;
  RowProfile({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(
      prefix: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
      child: Text(value),
    );
  }
}
