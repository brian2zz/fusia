import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/card_account_widget.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var DataUser =
                  snapshot.data['item'][3]['request']['body']['formdata'];
              return ListView(
                children: [
                  _stepper(),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: CardMember(point: value, name: DataUser[0]['value']),
                  ),
                  _indicatorPoint(),
                  _progressMembership(),
                  SizedBox(height: 60),
                  Benefit(),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget Benefit() {
    return Column(
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
        SizedBox(height: 20),
        (value >= 0 && value <= 125)
            ? benefitBronze()
            : (value >= 125 && value <= 250)
                ? benefitGold()
                : (value > 250 && value <= 375)
                    ? benefitPlatinum()
                    : benefitVvip(),
      ],
    );
  }

  Widget _progressMembership() {
    return Column(
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
  }

  Widget _indicatorPoint() {
    return ListTile(
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
  }

  Widget _stepper() {
    return Container(
      height: 80,
      child: Theme(
        data: ThemeData(
            colorScheme:
                ColorScheme.light(primary: Color.fromARGB(255, 80, 36, 35))),
        child: Stepper(
          type: StepperType.horizontal,
          steps: [
            Step(
              isActive: value >= 0,
              title: Text('Bronze'),
              content: Container(),
            ),
            Step(
              isActive: value >= 125,
              title: Text('Gold'),
              content: Container(),
            ),
            Step(
              isActive: value >= 250,
              title: Text('Platinum'),
              content: Container(),
            ),
            Step(
              isActive: value >= 375,
              title: Text('Vvip'),
              content: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class benefitBronze extends StatelessWidget {
  const benefitBronze({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BenefitText(
          text: 'Spent IDR 3,000,000 - IDR 6,000,000 for the last 3 months',
        ),
        SizedBox(height: 20),
        BenefitText(
            text:
                'Additional Benefit : Every 10,000 purchase will be gained 2 points'),
        SizedBox(height: 20),
        BenefitText(
            text:
                'For Catering Service, every IDR 100,000 purchase will be gained 4 points'),
      ],
    );
  }
}

class benefitGold extends StatelessWidget {
  const benefitGold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BenefitText(
          text: 'Spent IDR 6,000,000 - IDR 15,000,000 for the last 3 months',
        ),
        SizedBox(height: 20),
        BenefitText(
            text:
                'Additional Benefit : Every 10,000 purchase will be gained 3 points'),
        SizedBox(height: 20),
        BenefitText(
            text:
                'For Catering Service, every IDR 100,000 purchase will be gained 5 points'),
      ],
    );
  }
}

class benefitPlatinum extends StatelessWidget {
  const benefitPlatinum({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BenefitText(
          text: 'Spent IDR 6,000,000 - IDR 15,000,000 for the last 3 months',
        ),
        SizedBox(height: 20),
        BenefitText(
            text:
                'Additional Benefit : Every 10,000 purchase will be gained 3 points'),
        SizedBox(height: 20),
        BenefitText(
            text:
                'For Catering Service, every IDR 100,000 purchase will be gained 5 points'),
      ],
    );
  }
}

class benefitVvip extends StatelessWidget {
  const benefitVvip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BenefitText(
          text: 'Spent over IDR 15,000,000 for the last 3 months',
        ),
        SizedBox(height: 20),
        BenefitText(
            text:
                'Additional Benefit : Every 10,000 purchase will be gained 4 points Gain 5 points per every visit'),
        SizedBox(height: 20),
        BenefitText(
            text:
                'For Catering Service, every IDR 100,000 purchase will be gained 6 points'),
      ],
    );
  }
}

class BenefitText extends StatelessWidget {
  final String text;
  const BenefitText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 100, 100, 100),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
