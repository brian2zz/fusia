
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar.dart';
import 'package:fusia/widget/custom_appbar_account.dart';

class DetailOutletMenuPage extends StatefulWidget {
  
  _DetailOutletMenuPageState createState() => _DetailOutletMenuPageState();
}

class _DetailOutletMenuPageState extends State<DetailOutletMenuPage> {


  @override
  Widget build(BuildContext context) {
    
    Widget appbar() => CustomAppBar(title: "Menu", isAccessDetail: true);

    Widget menuView() => SizedBox(
      width: ScreenUtil().screenWidth,
      height: 524.h,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset('assets/images/dummy_menu.png'),
      ),
    );
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: menuView(),
          appBar: PreferredSize(
            child: appbar(), 
            preferredSize: Size.fromHeight(78.h),
          ),
        )
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary), 
    );
  }
}