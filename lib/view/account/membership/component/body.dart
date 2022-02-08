import 'package:flutter/material.dart';
import 'package:fusia/view/account/membership/component/item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  _bodyState createState() => _bodyState();
}

class _bodyState extends State<body> {
  double value = 0;

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          stepper(value: value),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                (value >= 0 && value <= 125)
                    ? CardMemberBronze(
                        name: "Nathasya Maria Simandjuntak",
                        point: "${(value).toStringAsFixed(0)}",
                      )
                    : (value >= 125 && value <= 250)
                        ? CardMemberGold(
                            name: "Nathasya Maria Simandjuntak",
                            point: "${(value).toStringAsFixed(0)}",
                          )
                        : (value > 250 && value <= 375)
                            ? CardMemberPlatinum(
                                name: "Nathasya Maria Simandjuntak",
                                point: "${(value).toStringAsFixed(0)}",
                              )
                            : CardMemberVvip(
                                name: "Nathasya Maria Simandjuntak",
                                point: "${(value).toStringAsFixed(0)}",
                              ),
              ],
            ),
          ),
          ListTile(
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
          ),
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
          SizedBox(height: 60),
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
