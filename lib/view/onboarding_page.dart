import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

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

  final _currentPageNotifier = ValueNotifier<int>(0);
  final PageController scrollcontroller =
      PageController(keepPage: true, initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  scrollboard(value) {
    setState(() {
      _currentPageNotifier.value = value;
      if (value == 2) {
        scrollcontroller.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent() => PageView.builder(
          controller: scrollcontroller,
          itemCount: imageList!.length,
          onPageChanged: (value) => scrollboard(value),
          itemBuilder: (context, index) {
            return Image.asset(imageList![index]);
          },
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              bodyContent(),
              Positioned(
                child: CirclePageIndicator(
                  itemCount: 3,
                  currentPageNotifier: _currentPageNotifier,
                  selectedDotColor: ColorsTheme.primary,
                  dotColor: Colors.grey,
                ),
                top: 410.h,
                left: 100.w,
                right: 100.w,
              ),
            ],
          ),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.white),
    );
  }
}
