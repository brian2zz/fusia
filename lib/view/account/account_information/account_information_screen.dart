import 'package:flutter/material.dart';
import 'package:fusia/view/account/account_information/component/appbar.dart';
import 'package:fusia/view/account/account_information/component/body.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:get/get.dart';



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