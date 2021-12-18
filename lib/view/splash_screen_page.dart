import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isLogin = false.obs;
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    Duration timers = const Duration(seconds: 4);
    return Timer(timers, () => navigationPage());
  }

  navigationPage() async {
    if (!isLogin.value) {
      setState(() {
        Navigator.pushReplacementNamed(context, '/onboarding');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Image.asset('assets/images/logo_fusia.png'),
          ),
          backgroundColor: ColorsTheme.primary!,
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary!),
    );
  }
}
