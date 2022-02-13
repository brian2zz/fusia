import 'package:flutter/material.dart';
import 'package:fusia/screen/change_password/component/appbar.dart';
import 'package:fusia/screen/change_password/component/body.dart';

class changePassword extends StatelessWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: body(),
    );
  }
}
