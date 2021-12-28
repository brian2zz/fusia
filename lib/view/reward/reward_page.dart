// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../color/colors_theme.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({Key? key}) : super(key: key);

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  TextStyle headerStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: ColorsTheme.white,
  );

  TextStyle contentStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.black,
  );

  TextStyle contentStyle2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsTheme.black,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Reward"),
          ),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}
