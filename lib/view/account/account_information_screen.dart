import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/view/account/change_password_page.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Account Information'),
      body: body(),
    );
  }
}

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
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

  DateTime? date;
  String? dateBirthday() {
    if (date == null) {
      return null;
    } else {
      return DateFormat('yyyy-MM-dd').format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var DataUser =
                snapshot.data['item'][3]['request']['body']['formdata'];
            return ListView(
              children: <Widget>[
                _avatarProfile(),
                SizedBox(
                  height: 60,
                ),
                _formEditAccount(DataUser),
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _formEditAccount(DataUser) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          label: 'Email',
        ),
        SizedBox(height: 10),
        textField(
          textController: DataUser[1]['value'],
        ),
        SizedBox(height: 10),
        Label(
          label: 'Phone Number',
        ),
        SizedBox(height: 10),
        textField(
          textController: DataUser[3]['value'],
        ),
        SizedBox(height: 10),
        Label(
          label: 'Birthday',
        ),
        SizedBox(height: 10),
        _birthdayInput(DataUser),
      ],
    );
  }

  Widget _birthdayInput(DataUser) {
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
      ),
      controller: TextEditingController(
          text:
              (dateBirthday() == null) ? DataUser[2]['value'] : dateBirthday()),
      style: TextStyle(
        color: Color.fromARGB(255, 144, 152, 177),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }

  Future PickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() => date = newDate);
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
      style: TextStyle(
        color: Color.fromARGB(255, 144, 152, 177),
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
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
