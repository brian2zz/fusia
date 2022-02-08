import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/view/account/change_password/component/appbar.dart';
import 'package:fusia/view/account/change_password/component/body.dart';
import 'package:get/get.dart';


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
