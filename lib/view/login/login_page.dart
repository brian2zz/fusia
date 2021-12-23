import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          color: Colors.blueGrey.shade800,
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
                        "Sign in to continue",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
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
          Navigator.pushReplacementNamed(context, '/navigation');
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: 400,
          height: 57,
          child: Center(
            child: Text(
              'Sign In',
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
      Padding(padding: EdgeInsets.only(top: 16.0)),
      Row(
        children: [
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'OR',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
      Padding(padding: EdgeInsets.only(top: 16.0)),
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.grey,
            minimumSize: Size(400, 57)),
        onPressed: () {},
        // icon: FaIcon(FontAwesomeIcons.google),
        icon: Image.asset('assets/icons/ic_google.png'),
        label: Text(
          'Login with Google',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 30.0)),
      GestureDetector(
        onTap: () => {},
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.blueGrey.shade900,
            fontSize: 12.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(top: 10.0)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have a account? ",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
            ),
          ),
          GestureDetector(
            onTap: () => {Navigator.pushReplacementNamed(context, '/register')},
            child: Text(
              'Register',
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
