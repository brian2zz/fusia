import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fusia/color/colors_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<String>? imageList = [
    'assets/images/logo_onboarding_1.png',
    'assets/images/logo_onboarding_2.png',
    'assets/images/logo_onboarding_3.png',
  ];

  @override
  Widget build(BuildContext context) {
    Widget bodyContent() => PageView.builder(
          itemCount: imageList!.length,
          itemBuilder: (context, index) {
            return Image.asset(imageList![index]);
          },
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: bodyContent(),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.white),
    );
  }
}
