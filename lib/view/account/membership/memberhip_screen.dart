import 'package:flutter/material.dart';
import 'package:fusia/view/account/membership/component/appbar.dart';
import 'package:fusia/view/account/membership/component/body.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:get/get.dart';


class membership extends StatelessWidget {
  const membership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: body(),
    );
  }
}
