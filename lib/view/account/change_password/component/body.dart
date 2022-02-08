import 'package:flutter/material.dart';
import 'package:fusia/view/account/change_password/component/item.dart';


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
