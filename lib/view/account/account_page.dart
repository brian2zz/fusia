// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextStyle headerStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: ColorsTheme.white,
  );

  TextStyle contentStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.black,
  );

  TextStyle contentStyle2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsTheme.black,
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey.shade600,
            ),
            title: Text(
              "Account",
              style: TextStyle(
                  color: Colors.blueGrey.shade900,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900),
            ),
          ),
          body: body,
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }

  Widget body = Container(
    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
    child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            _avatarProfile(),
            SizedBox(
              height: 5,
            ),
            _buildCard(),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 10,
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
            SizedBox(
              height: 20,
            ),
            _buildMenu(),
          ],
        ),
      ),
    ),
  );
}

Widget _buildMenu() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/ic_menu_account.png',
                  color: Colors.blue.shade800,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("Account Information",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900)),
              ],
            ),
            Container(
              width: 20,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/ic_menu_reward.png',
                  color: Colors.blue.shade800,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("Membership",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900)),
              ],
            ),
            Container(
              width: 20,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/ic_menu_promo.png',
                  color: Colors.blue.shade800,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("Benefit",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900)),
              ],
            ),
            Container(
              width: 20,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/ic_keluar.png',
                  color: Colors.blue.shade800,
                ),
                SizedBox(
                  width: 15,
                ),
                Text("Exit",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900)),
              ],
            ),
            Container(
              width: 20,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

Widget _buildCard() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Container(
          height: 192,
          width: 370,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            gradient:
                LinearGradient(colors: [Color(0xFFDEC598), Color(0xFFBC9B68)]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Bronze",
                          style: TextStyle(
                              color: Colors.brown.shade600,
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900)),
                      Text("150 pts",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900))
                    ],
                  ),
                  SizedBox(
                    height: 37,
                    width: 37,
                    child: Image.asset('assets/icons/ic_medal.png'),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text("Jono Maximum Gold",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _avatarProfile() {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 10.0, 50.0, 20.0),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/mascot.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Jono Maximus Gold",
                      style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "@jono",
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
