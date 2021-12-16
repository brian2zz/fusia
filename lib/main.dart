import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/onboarding_page.dart';
import 'package:fusia/view/splash_screen_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp(
        title: 'Fusia App',
        navigatorKey: navKey,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (BuildContext context) => const SplashScreen(),
          '/onboarding': (BuildContext context) => const OnboardingPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
