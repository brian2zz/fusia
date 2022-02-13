import 'package:flutter/material.dart';
import 'package:fusia/screen/membership/component/item.dart';
import 'package:progress_timeline/progress_timeline.dart';

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
                CardMember(
                  name: "Nathasya Maria Simandjuntak",
                  point: '150',
                  level: 'bronze',
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
            max: 375,
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
            leading: Text('Bronze',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
            trailing: Text('Gold',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                )),
          ),
          Center(
            child: Text('Earn 125 points more to reach GOLD tier',
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
      ),
    );
  }
}


