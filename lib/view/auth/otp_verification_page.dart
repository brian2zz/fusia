// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/controller/login_controller.dart';
import 'package:fusia/server/arguments_pass/temp_pass_otp.dart';
import 'package:fusia/widget/custom_progress_loading.dart';
import 'package:fusia/widget/custom_toast.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../color/colors_theme.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  LoginController? controller;
  
  var kodeotp;

  @override
  void initState() {
    super.initState();
    initConstructor();
  }

  initConstructor() {
    controller = Get.put(LoginController());
    kodeotp = "".obs;
  }

  @override
  Widget build(BuildContext context) {
    final otpargs =
        ModalRoute.of(context)!.settings.arguments as OTPArgumentsPassingData;

    var convertoFormatNumber = otpargs.phoneNumber.replaceFirst("0", "+62 ");

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
                  Text("Sent to $convertoFormatNumber",
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900)),
                  SizedBox(
                    height: 50,
                  ),
                  _buildPinText(context, otpargs.phoneNumber, controller!),
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
                  /*Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 16.0)),
                        InkWell(
                          onTap: () =>verifyAccount1(otpargs.phoneNumber, , context, controller) ,
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
                  ),*/
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

verifyAccount1(phone, code,context,controller) async {
    showdialog(context);
    var result = await controller.verifyOTPController(phone, code);
    //showToast(context, result['details']);
    if (result['status'] == 200) {
      hidedialog(context);
      Navigator.of(context).pushNamed('/navigation');
    }
}

Widget _buildPinText(
    BuildContext context, String phoneNumber, LoginController controller) {
  verifyAccount(phone, code) async {
    showdialog(context);
    var result = await controller.verifyOTPController(phone, code);
    if (result['status'] == 200) {
      hidedialog(context);

      controller.storedUserLocalData("true",result['details']['databody']['token'], result['details']['databody']['cust_id'].toString());

      Navigator.of(context).pushNamed('/navigation');
    }
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
    child: PinFieldAutoFill(
      codeLength: 4,
      onCodeSubmitted: (val) => verifyAccount(phoneNumber, val),
    ),
  );
}
