import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fusia/screen/account_information/component/item.dart';
import 'package:fusia/screen/change_password/change_password_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);
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
                textField(
                  textController: DataUser[2]['value'],
                ),
                SizedBox(height: 20),
                ChangePassword(),
                SizedBox(height: 25),
                ButtonSave(),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
