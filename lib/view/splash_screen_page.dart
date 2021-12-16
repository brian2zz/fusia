import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusia/color/colors_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    return Timer(const Duration(seconds: 4), navigationPage());
  }

  navigationPage() async {
    setState(() {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
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
