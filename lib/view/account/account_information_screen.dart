import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/controller/dashboard_controller.dart';
import 'package:fusia/controller/login_controller.dart';
import 'package:fusia/model/data_account_model.dart';
import 'package:fusia/view/account/change_password_page.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

TextStyle textFormStyle = TextStyle(
  color: Color.fromARGB(255, 144, 152, 177),
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);

class AccountInformation extends StatefulWidget {
  const AccountInformation({Key? key}) : super(key: key);

  @override
  _AccountInformationState createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  //controller
  LoginController? userController;
  DashboardController? dashboardController;

  //global variable

  var userToken;
  var customerId;
  var namaUser;
  var emailUser;
  var phoneUser;
  var tanggalLahirUser;
  var photoUrlUser;
  var membershipUser;

  @override
  initState() {
    super.initState();

    initConstructor();
    initData();
  }

  initConstructor() {
    userController = Get.put(LoginController());
    dashboardController = Get.put(DashboardController());

    namaUser = "".obs;
    emailUser = "".obs;
    phoneUser = "".obs;
    tanggalLahirUser = "".obs;
  }

  initData() async {
    await userController!.retrieveUserLocalData();

    setState(() {
      var token = LoginController.userToken.value;
      var customerId = LoginController.customerId.value;

      retrieveDashboard(token, customerId);
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

  DateTime? date;
  String Birthday() {
    if (date == null) {
      return tanggalLahirUser.value;
    } else {
      return DateFormat('dd-MM-yyyy').format(date!);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Account Information'),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: <Widget>[
          _avatarProfile(),
          SizedBox(
            height: 60,
          ),
          Label(
            label: 'Email',
          ),
          SizedBox(height: 10),
          textField(
            textController: emailUser.value,
          ),
          SizedBox(height: 10),
          Label(
            label: 'Phone Number',
          ),
          SizedBox(height: 10),
          textField(
            textController: phoneUser.value,
          ),
          SizedBox(height: 10),
          Label(
            label: 'Birthday',
          ),
          SizedBox(height: 10),
          _birthday(context),
          SizedBox(height: 20),
          _changePassword(context),
          SizedBox(height: 25),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              color: Color.fromARGB(255, 80, 36, 35),
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _birthday(BuildContext context) {
    return TextFormField(
      onTap: () => PickDate(context),
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.date_range_outlined,
          color: Color.fromARGB(255, 144, 152, 177),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
        hintText: 'Tanggal Lahir',
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 144, 152, 177),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      controller: TextEditingController(text: Birthday()),
      style: textFormStyle,
    );
  }

  Widget _changePassword(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ChangePassword();
          }),
        );
      },
      leading: Icon(Icons.lock_outline, color: Color.fromARGB(255, 34, 50, 99)),
      title: Text(
        'Change Password        *****************',
        style: TextStyle(
          color: Color.fromARGB(255, 34, 50, 99),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _avatarProfile() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 60),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {},
            child: Text(
              'Ubah Photo Profile',
              style: TextStyle(
                color: Color.fromARGB(255, 34, 50, 99),
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

class textField extends StatelessWidget {
  final String textController;
  const textField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
      ),
      controller: TextEditingController(text: textController),
      style: textFormStyle,
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
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
