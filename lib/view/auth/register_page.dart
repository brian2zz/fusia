// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../color/colors_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _startDateController = TextEditingController();
  DateFormat dateFormat = DateFormat('yyyyMMdd');
  DateFormat displayDateFormat = DateFormat('dd-MMM-yyyy');
  var now = DateTime.now();

  TextStyle style1 = TextStyle(
    fontFamily: 'Poppins',
    color: ColorsTheme.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  TextStyle style2 = TextStyle(
    fontFamily: 'Poppins',
    color: ColorsTheme.primary,
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              Container(
                height: size.height * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 99.h,
                      child: Image.asset(
                        'assets/images/mascot.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2, bottom: 5),
                      child: Text(
                        "Fusia App",
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 15.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10, bottom: 1),
                      child: Text(
                        "Let's Get Started",
                        style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 15.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Create an new Account",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          hintText: "Full Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          labelText: "Full Name"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            size: 30,
                          ),
                          hintText: "Your Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          labelText: "Your Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: _startDateController.text = displayDateFormat.format(now),
                      onTap: () => {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2025))
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: "Birthday",
                          prefixIcon: Icon(
                            Icons.date_range_outlined,
                            size: 30,
                          ),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          labelText: "Birthday"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_iphone_outlined,
                            size: 30,
                          ),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          labelText: "Phone Number"),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    _buildButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.white),
    );
  }
}

Widget _buildButton(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 16.0)),
      InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/verification');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: 400,
          height: 57,
          child: Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            ),
          ),
          decoration: BoxDecoration(
            color: ColorsTheme.primary,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 25.0)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Have a account? ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
            ),
          ),
          GestureDetector(
            onTap: () => {Navigator.pushReplacementNamed(context, '/login')},
            child: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.blueGrey.shade900,
                fontSize: 12.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Expanded buildDivider() {
  return Expanded(
      child: Divider(
    color: Colors.grey,
    height: 1.5,
  ));
}
