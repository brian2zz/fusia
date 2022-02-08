import 'package:flutter/material.dart';
import 'package:fusia/view/account/account_information/component/item.dart';

import 'package:get/get.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: <Widget>[
          AvatarProfile(
            PhotoProfile:
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
          ),
          
          SizedBox(height: 60),
          Label(
            label: 'Email',
          ),
          SizedBox(height: 10),
          textField(
            textController: "Nathasya Maria Simandjuntak",
          ),

          SizedBox(height: 10),
          Label(
            label: 'Phone Number',
          ),
          SizedBox(height: 10),
          textField(
            textController: "08119107111",
          ),

          SizedBox(height: 10),
          Label(
            label: 'Birthday',
          ),
          SizedBox(height: 10),
          textField(
            textController: "2003-01-30",
          ),

          SizedBox(height: 20),
          ChangePassword(),

          SizedBox(height: 25),
          ButtonSave(),
        ],
      ),
    );
  }
}

