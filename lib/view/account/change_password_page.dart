import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Change Password'),
      body: body(),
    );
  }
}

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(height: 40),
          Label(
            text: 'Old Password',
          ),
          SizedBox(height: 10),
          textField(
            Hint: '****************',
          ),
          SizedBox(height: 40),
          Label(
            text: 'New Password',
          ),
          SizedBox(height: 10),
          textField(
            Hint: '****************',
          ),
          SizedBox(height: 40),
          Label(
            text: 'New Password Again',
          ),
          SizedBox(height: 10),
          textField(
            Hint: '****************',
          ),
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
}

class textField extends StatelessWidget {
  final String Hint;
  const textField({
    Key? key,
    required this.Hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock_outlined,
          color: Color.fromARGB(255, 144, 152, 177),
        ),
        hintText: Hint,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 144, 152, 177),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
      ),
      style: TextStyle(
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;
  const Label({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
