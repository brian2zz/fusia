import 'dart:convert';
import 'package:fusia/view/account/account_information_screen.dart';
import 'package:fusia/view/account/memberhip_screen.dart';
import 'package:fusia/widget/custom_appbar_account.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/card_account_widget.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Account',
      ),
      body: body(),
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  getData() async {
    try {
      var response = await http.get(Uri.parse(
          "https://www.postman.com/collections/e9afc80dca54635d1ef9"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var DataUser =
                snapshot.data['item'][3]['request']['body']['formdata'];
            double point = 400;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                _avatarProfile(DataUser),
                SizedBox(
                  height: 40,
                ),
                CardMember(
                  name: DataUser[0]['value'],
                  point: point,
                ),
                SizedBox(
                  height: 30,
                ),
                _buildMenu(context),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget _buildMenu(BuildContext context) {
  return Expanded(
    child: ListView(
      children: <Widget>[
        ListMenu(
            title: 'Account Information',
            image: "assets/icons/ic_menu_account.png",
            press: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return AccountInformation();
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
  );
}

Widget _avatarProfile(DataUser) {
  return Row(
    children: <Widget>[
      CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
      ),
      SizedBox(width: 25),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            DataUser[0]['value'],
            style: TextStyle(
              color: Color.fromARGB(255, 34, 50, 99),
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 20),
          Text(
            '@nathasya',
            style: TextStyle(
              color: Color.fromARGB(255, 144, 152, 177),
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          )
        ],
      ),
    ],
  );
}

Widget _bottomNavBar() {
  return BottomNavigationBar(
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
  );
}

class ListMenu extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback press;
  const ListMenu({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Image.asset(image, color: Color.fromARGB(255, 34, 50, 99)),
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 34, 50, 99),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
