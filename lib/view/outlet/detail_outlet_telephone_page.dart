
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailOutletTelephonePage extends StatefulWidget {

  _DetailOutletTelephonePageState createState() => _DetailOutletTelephonePageState();
}

class _DetailOutletTelephonePageState extends State<DetailOutletTelephonePage> {

  @override
  Widget build(BuildContext context) {

    Widget appbar() => CustomAppBar(title: "Telepon", isAccessDetail: true);

    Widget numberInput() => FlatButton(
      onPressed: () => launch("tel://0881036014226"),
      child: Text("Call me"),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: numberInput(),
          appBar: PreferredSize(
            child: appbar(),
            preferredSize: Size.fromHeight(78.h),
          )
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}