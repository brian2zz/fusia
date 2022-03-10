// import 'package:coba_fusia/color/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/controller/login_controller.dart';
import 'package:fusia/model/sending_otp_status_model.dart';
import 'package:fusia/server/arguments_pass/temp_pass_otp.dart';
import 'package:fusia/widget/custom_progress_loading.dart';
import 'package:fusia/widget/custom_toast.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //server controller
  LoginController? loginController;

  //input controller
  TextEditingController? phoneInput;

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
  void initState() {
    super.initState();
    initConstructor();
  }

  initConstructor() {
    phoneInput = TextEditingController();
    loginController = Get.put(LoginController());
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 99.h,
                      child: Image.asset(
                        'assets/images/mascot.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.h, bottom: 5.h),
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
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
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
                      controller: phoneInput,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorsTheme.grey!),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_iphone_outlined,
                            size: 30,
                          ),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: ColorsTheme.grey!),
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          labelText: "Phone Number"),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    _buildButton(context, phoneInput!, loginController!),
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

Widget _buildButton(BuildContext context, TextEditingController phoneInput,
    LoginController controller) {
  requesttoLogin() async {
    showdialog(context);
    var result = await controller.requestLoginController(phoneInput.text);

    if (result['status'] == 200) {
      if (result['details']['status'] == "Success") {
        hidedialog(context);
        Navigator.of(context).pushNamed(
          '/verification',
          arguments: OTPArgumentsPassingData(phoneNumber: phoneInput.text),
        );
      } else {
        hidedialog(context);
        showToast(context, "gagal melakukan login.");
      }
    }
  }

  validatePhoneInput() async {
    if (phoneInput.text.isEmpty) {
      snackbar() => SnackBar(
            content: Text(
              "Silahkan masukkan no.hp terlebih dahulu",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsTheme.white),
            ),
            duration: const Duration(milliseconds: 1000),
          );
      ScaffoldMessenger.of(context).showSnackBar(snackbar());
    } else {
      await requesttoLogin();
    }
  }

  return Column(
    children: <Widget>[
      const Padding(padding: EdgeInsets.only(top: 16.0)),
      InkWell(
        onTap: () => validatePhoneInput(),
        splashColor: ColorsTheme.white,
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
