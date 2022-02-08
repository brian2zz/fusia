import 'package:flutter/material.dart';
import 'package:fusia/view/account/account/component/appbar.dart';
import 'package:fusia/view/account/account/component/body.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:get/get.dart';


class account_screen extends StatelessWidget {
  const account_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        selectedItemColor: Color.fromARGB(255, 80, 36, 35),
      ),
    );
  }
}
