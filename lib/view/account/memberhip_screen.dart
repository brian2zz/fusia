import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/card_account_widget.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

TextStyle benefitStyle = TextStyle(
  color: Color.fromARGB(255, 100, 100, 100),
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
);

class membership extends StatelessWidget {
  const membership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'Membership'),
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

  double value = 0;

  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var DataUser =
                  snapshot.data['item'][3]['request']['body']['formdata'];
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                children: [
                  _stepper(),
                  SizedBox(height: 30.h),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: BuildCardMember(
                        point: value, name: DataUser[0]['value']),
                  ),
                  _indicatorPoint(),
                  _progressMembership(),
                  SizedBox(height: 60.h),
                  Benefit(),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget Benefit() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Benefits',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: 20.h),
          (value >= 0 && value <= 125)
              ? BuildBenefit(
                  text1:
                      'Spent IDR 3,000,000 - IDR 6,000,000 for the last 3 months',
                  text2:
                      'Additional Benefit : Every 10,000 purchase will be gained 2 points',
                  text3:
                      'For Catering Service, every IDR 100,000 purchase will be gained 4 points',
                  text4: '')
              : (value >= 125 && value <= 250)
                  ? BuildBenefit(
                      text1:
                          'Spent IDR 6,000,000 - IDR 15,000,000 for the last 3 months',
                      text2:
                          'Additional Benefit : Every 10,000 purchase will be gained 3 points',
                      text3:
                          'For Catering Service, every IDR 100,000 purchase will be gained 5 points',
                      text4: '')
                  : (value > 250 && value <= 375)
                      ? BuildBenefit(
                          text1:
                              'Spent IDR 6,000,000 - IDR 15,000,000 for the last 3 months',
                          text2:
                              'Additional Benefit : Every 10,000 purchase will be gained 3 points',
                          text3:
                              'For Catering Service, every IDR 100,000 purchase will be gained 5 points',
                          text4: '')
                      : BuildBenefit(
                          text1:
                              'Spent over IDR 15,000,000 for the last 3 months',
                          text2:
                              'Additional Benefit : Every 10,000 purchase will be gained 4 points',
                          text3: 'Gain 5 points per every visit',
                          text4:
                              'For Catering Service, every IDR 100,000 purchase will be gained 6 points')
        ],
      );

  Widget _progressMembership() => Column(
        children: [
          Slider(
            value: value,
            min: 0,
            max: 500,
            activeColor: Color.fromARGB(255, 92, 97, 244),
            inactiveColor: Color.fromARGB(255, 215, 215, 215),
            thumbColor: Color.fromARGB(255, 92, 97, 244),
            onChanged: (value) => setState(
              () {
                this.value = value;
              },
            ),
          ),
          ListTile(
            leading: Text(
                (value >= 0 && value <= 125)
                    ? "bronze"
                    : (value >= 125 && value <= 250)
                        ? "Gold"
                        : "Platinum",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
            trailing: Text(
                (value >= 0 && value <= 125)
                    ? "Gold"
                    : (value >= 125 && value <= 250)
                        ? "Platinum"
                        : "Vvip",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
          ),
          Center(
            child: Text(
                (value >= 0 && value <= 125)
                    ? 'Earn 125 points more to reach GOLD tier'
                    : (value >= 125 && value <= 250)
                        ? 'Earn 125 points more to reach Platinum tier'
                        : 'Earn 125 points more to reach Vvip tier',
                style: TextStyle(
                  color: Color.fromARGB(255, 215, 215, 215),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
          ),
        ],
      );

  Widget _indicatorPoint() => ListTile(
        leading: Text('Your Point',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            )),
        trailing: Text('${(value).toStringAsFixed(0)}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            )),
      );

  Widget _stepper() => Container(
        height: 80.h,
        child: Theme(
          data: ThemeData(
              colorScheme:
                  ColorScheme.light(primary: Color.fromARGB(255, 80, 36, 35))),
          child: Stepper(
            type: StepperType.horizontal,
            steps: [
              Step(
                isActive: value >= 0,
                title: Text('Bronze', style: TextStyle(fontSize: 12.sp)),
                content: Container(),
              ),
              Step(
                isActive: value >= 125,
                title: Text('Gold', style: TextStyle(fontSize: 12.sp)),
                content: Container(),
              ),
              Step(
                isActive: value >= 250,
                title: Text('Platinum', style: TextStyle(fontSize: 12.sp)),
                content: Container(),
              ),
              Step(
                isActive: value >= 375,
                title: Text('Vvip', style: TextStyle(fontSize: 12.sp)),
                content: Container(),
              ),
            ],
          ),
        ),
      );
}

class BuildBenefit extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const BuildBenefit({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text1, style: benefitStyle),
        SizedBox(height: 20.h),
        Text(text2, style: benefitStyle),
        SizedBox(height: 20.h),
        Text(text3, style: benefitStyle),
        SizedBox(height: 20.h),
        Text(text4, style: benefitStyle),
      ],
    );
  }
}
