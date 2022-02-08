import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class CardMemberVvip extends StatelessWidget {
  final String name;
  final String point;

  const CardMemberVvip({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      // width: 400,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(colors: [
          Color.fromARGB(
            255,
            152,
            144,
            227,
          ),
          Color.fromARGB(
            255,
            177,
            244,
            207,
          ),
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Vvip",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${point}pts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/icons/ic_medal.png',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class CardMemberPlatinum extends StatelessWidget {
  final String name;
  final String point;

  const CardMemberPlatinum({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      // width: 400,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(colors: [
          Color.fromARGB(
            255,
            166,
            166,
            166,
          ),
          Color.fromARGB(
            255,
            108,
            108,
            108,
          ),
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Platinum",
                    style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          219,
                          218,
                          216,
                        ),
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${point}pts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/icons/ic_medal.png',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class CardMemberGold extends StatelessWidget {
  final String name;
  final String point;
  const CardMemberGold({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      // width: 400,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(colors: [
          Color.fromARGB(
            255,
            254,
            201,
            25,
          ),
          Color.fromARGB(
            255,
            228,
            161,
            18,
          ),
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Gold",
                    style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          211,
                          155,
                          0,
                        ),
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${point}pts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/icons/ic_medal.png',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class CardMemberBronze extends StatelessWidget {
  final String name;
  final String point;

  const CardMemberBronze({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      // width: 400,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(colors: [
          Color.fromARGB(
            255,
            222,
            197,
            152,
          ),
          Color.fromARGB(
            255,
            188,
            155,
            104,
          ),
        ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Bronze",
                    style: TextStyle(
                        color: Colors.brown.shade600,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${point}pts',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/icons/ic_medal.png',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
          ),
          Text(
            name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class stepper extends StatelessWidget {
  const stepper({
    Key? key,
    required this.value,
  }) : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
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
