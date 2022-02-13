import 'package:flutter/material.dart';
import 'package:fusia/screen/account_information/component/appbar.dart';
import 'package:fusia/screen/account_information/component/body.dart';

class account_information extends StatelessWidget {
  const account_information({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: body(),
    );
  }
}