import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/account/account_page.dart';
import 'package:fusia/view/auth/login_page.dart';
import 'package:fusia/view/auth/register_page.dart';
import 'package:fusia/view/home_dashboard_page.dart';
import 'package:fusia/view/home_navigation_menu_page.dart';
import 'package:fusia/view/onboarding_page.dart';
import 'package:fusia/view/promo/promo_page.dart';
import 'package:fusia/view/reward/reward_page.dart';
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
              '/navigation': (BuildContext context) =>
                  const HomeNavigationMenu(),
              '/onboarding': (BuildContext context) => const OnboardingPage(),
              '/home_dashboard': (BuildContext context) =>
                  const HomeDashboardPage(),
              '/promo': (BuildContext context) => const PromoPage(),
              '/reward': (BuildContext context) => const RewardPage(),
              '/account': (BuildContext context) => const AccountPage(),
              '/login': (BuildContext context) => const LoginPage(),
              '/register': (BuildContext context) => const RegisterPage(),
            },
          );
        });
  }
}
