import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/onboarding_page.dart';
import 'package:fusia/view/splash_screen_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () {
          return MaterialApp(
            title: 'Fusia App',
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routes: {
              '/': (BuildContext context) => const SplashScreen(),
              '/onboarding': (BuildContext context) => const OnboardingPage(),
            },
          );
        });
  }
}
