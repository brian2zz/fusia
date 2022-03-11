import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/controller/account_controller.dart';
import 'package:fusia/controller/dashboard_controller.dart';
import 'package:fusia/controller/login_controller.dart';
import 'package:fusia/model/data_account_model.dart';
import 'package:fusia/view/account/camera_screen.dart';
// import 'package:fusia/view/account/change_password_page.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:fusia/widget/custom_progress_loading.dart';
import 'package:fusia/widget/custom_toast.dart';
import 'package:get/get.dart';
// import 'package:camerax/camerax.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AccountInformation extends StatefulWidget {
  AccountInformation({Key? key}) : super(key: key);
  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  //controller
  LoginController? userController;
  DashboardController? dashboardController;
  AccountController? accountController;

  //global variable

  var userToken;
  var customerId;
  var namaUser;
  var emailUser;
  var phoneUser;
  var tanggalLahirUser;
  var photoUrlUser;
  var membershipUser;
  var havePassword;

  String? oldPassword;
  String? newPassword;
  @override
  initState() {
    super.initState();

    focusNode1.addListener(onFocusChange1);
    focusNode2.addListener(onFocusChange2);
    focusNode3.addListener(onFocusChange3);
    initConstructor();
    initData();
  }

  initConstructor() {
    userController = Get.put(LoginController());
    dashboardController = Get.put(DashboardController());
    accountController = Get.put(AccountController());

    namaUser = "".obs;
    emailUser = "".obs;
    phoneUser = "".obs;
    tanggalLahirUser = "".obs;
    havePassword = "".obs;
  }

  initData() async {
    await userController!.retrieveUserLocalData();

    setState(() {
      var token = LoginController.userToken.value;
      var customerId = LoginController.customerId.value;

      retrieveDashboard(token, customerId);
      // passwordStatus(customerId);
    });
  }

  retrieveDashboard(token, customerId) async {
    var result =
        await dashboardController!.retrieveDashboard(token, customerId);

    setState(() {
      if (result['status'] == 200) {
        DataAccountModel responsedata =
            DataAccountModel.fromJson(result['details']['databody']);

        namaUser.value = responsedata.custNama;
        tanggalLahirUser.value = responsedata.custTgllahir;
        phoneUser.value = responsedata.custHp;
        emailUser.value = responsedata.custEmail;
      }
    });
  }

  // passwordStatus(customerId) async {
  //   // showdialog(context);
  //   var result = await accountController!
  //       .RequestPassword(customerId, oldPassword, newPassword);
  //   setState(() {
  //     if (result['status'] == 200) {
  //       if (result['details']['success'] == true) {
  //         havePassword.value = 'false';
  //       } else {
  //         havePassword.value = 'true';
  //       }
  //     }
  //   });
  // }

  DateTime? date;
  String Birthday() {
    if (date == null) {
      return tanggalLahirUser.value;
    } else {
      return DateFormat('dd-MM-yyyy').format(date!);
    }
  }

  Color? textColor1 = ColorsTheme.grey;
  Color? textColor2 = ColorsTheme.grey;
  Color? textColor3 = ColorsTheme.grey;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();

  void onFocusChange1() {
    setState(() {
      textColor1 = focusNode1.hasFocus ? null : ColorsTheme.grey;
    });
  }

  void onFocusChange2() {
    setState(() {
      textColor2 = focusNode2.hasFocus ? null : ColorsTheme.grey;
    });
  }

  void onFocusChange3() {
    setState(() {
      textColor3 = focusNode3.hasFocus ? null : ColorsTheme.grey;
    });
  }

  @override
  void dispose() {
    focusNode1.removeListener(onFocusChange1);
    focusNode2.removeListener(onFocusChange2);
    focusNode3.removeListener(onFocusChange3);
    super.dispose();
  }

  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(title: 'Account Information'),
        body: _body(context),
      );

  Widget _body(BuildContext context) => Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: <Widget>[
            _AvatarProfile(context),
            SizedBox(
              height: 60.h,
            ),
            Label(
              label: 'Email',
            ),
            SizedBox(height: 10.h),
            TextFieldWidget(
                focusNode: focusNode1,
                textController: namaUser.value,
                textColor: textColor1),
            SizedBox(height: 10.h),
            Label(
              label: 'Phone Number',
            ),
            SizedBox(height: 10.h),
            TextFieldWidget(
                focusNode: focusNode2,
                textController: phoneUser.value,
                textColor: textColor2),
            SizedBox(height: 10.h),
            Label(
              label: 'Birthday',
            ),
            SizedBox(height: 10.h),
            _Birthday(context),
            SizedBox(height: 20.h),
            // _ChangePassword(context, havePassword.value),
            SizedBox(height: 25.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 40.w),
                color: ColorsTheme.primary,
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      );

  Center _AvatarProfile(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 60.h),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
          ),
          SizedBox(height: 25.h),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CameraScreen();
                }),
              );
            },
            child: Text(
              'Ubah Photo Profile',
              style: TextStyle(
                color: ColorsTheme.neutralDark,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Birthday(BuildContext context) => TextField(
        onTap: () => PickDate(context),
        focusNode: focusNode3,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.date_range_outlined,
            color: ColorsTheme.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorsTheme.neutralDark!),
          ),
          border: new OutlineInputBorder(
              borderSide: new BorderSide(
            color: ColorsTheme.whiteCream!,
          )),
          hintText: 'Tanggal Lahir',
          hintStyle: TextStyle(
            color: ColorsTheme.grey,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        controller: TextEditingController(text: Birthday()),
        style: TextStyle(
          color: textColor3,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      );

  // Widget _ChangePassword(BuildContext context, String havePassword) {
  //   bool password;
  //   if (havePassword == 'true') {
  //     password = true;
  //   } else {
  //     password = false;
  //   }
  //   return ListTile(
  //     onTap: () {
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) {
  //     return ChangePassword(havePassword: password);
  //   }),
  // );
  //     },
  //     leading: Icon(Icons.lock_outline, color: ColorsTheme.neutralDark),
  //     title: Text(
  //       password ? 'Change Password' : 'Add Password',
  //       style: TextStyle(
  //         color: ColorsTheme.neutralDark,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: 'Poppins',
  //       ),
  //     ),
  //     trailing: Icon(Icons.arrow_forward_ios),
  //   );
  // }

  Future PickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 70),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() => date = newDate);
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.focusNode,
    required this.textController,
    required this.textColor,
  }) : super(key: key);

  final FocusNode focusNode;
  final String textController;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsTheme.neutralDark!),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: ColorsTheme.whiteCream!,
        )),
      ),
      controller: TextEditingController(
        text: textController,
      ),
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String label;
  const Label({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: ColorsTheme.neutralDark,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
