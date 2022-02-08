import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/account/account/component/item.dart';
import 'package:fusia/view/account/account_information/account_information_screen.dart';
import 'package:fusia/view/account/membership/memberhip_screen.dart';
import 'package:get/get.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 60),
          Avatar(),
          SizedBox(height: 40),
          CardMember(),
          SizedBox(height: 30),
          Expanded(
            child: ListView(
              children: <Widget>[
                ListMenu(
                    title: 'Account Information',
                    image: "assets/icons/ic_menu_account.png",
                    press: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return account_information();
                        },
                      ));
                    }),
                SizedBox(height: 10),
                ListMenu(
                  title: 'Membership',
                  image: "assets/icons/ic_menu_reward.png",
                  press: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return membership();
                      },
                    ));
                  },
                ),
                SizedBox(height: 10),
                ListMenu(
                  title: 'Benefit',
                  image: "assets/icons/ic_menu_promo.png",
                  press: () {},
                ),
                SizedBox(height: 10),
                ListMenu(
                  title: 'Keluar',
                  image: "assets/icons/ic_keluar.png",
                  press: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
