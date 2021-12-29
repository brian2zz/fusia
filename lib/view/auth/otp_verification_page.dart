// import 'dart:js';

// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../color/colors_theme.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text("Verify your Phone Number",
                      style: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 25,
                  ),
                  Text("We sent you a code to verify \n your phone number",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 25,
                  ),
                  Text("Sent to +62 823 7025 6208",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 50,
                  ),
                  _buildPinText(),
                  SizedBox(
                    height: 35,
                  ),
                  Text("I didn't get the code",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 35,
                  ),
                  Text("Resend",
                      style: TextStyle(
                          color: Colors.brown.shade900,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 16.0)),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/navigation');
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: 400,
                            height: 57,
                            child: Center(
                              child: Text(
                                'Verify',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }

  Widget body = Container();
}

Widget _buildButton = Container();

Widget _buildPinText() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
    child: PinFieldAutoFill(
      codeLength: 4,
      // BoxDecoration(
      //     borderRadius: BorderRadius.circular(5),
      //     border: Border.all(width: 2)),
      onCodeChanged: (val) {
        print(val);
      },
    ),
  );
}
