import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardMember extends StatelessWidget {
  final String name;
  final double point;
  const CardMember({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          (point >= 0 && point <= 125)
              ? CardMemberBronze(point: point, name: name)
              : (point >= 125 && point <= 250)
                  ? CardMemberGold(point: point, name: name)
                  : (point > 250 && point <= 375)
                      ? CardMemberPlatinum(point: point, name: name)
                      : CardMemberVvip(point: point, name: name),
        ],
      ),
    );
  }
}

class CardMemberVvip extends StatelessWidget {
  const CardMemberVvip({
    Key? key,
    required this.point,
    required this.name,
  }) : super(key: key);

  final double point;
  final String name;

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
                        color: Colors.brown.shade600,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${(point).toStringAsFixed(0)}pts',
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
  const CardMemberPlatinum({
    Key? key,
    required this.point,
    required this.name,
  }) : super(key: key);

  final double point;
  final String name;

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
                        color: Colors.brown.shade600,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${(point).toStringAsFixed(0)}pts',
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
  const CardMemberGold({
    Key? key,
    required this.point,
    required this.name,
  }) : super(key: key);

  final double point;
  final String name;

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
                        color: Colors.brown.shade600,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '${(point).toStringAsFixed(0)}pts',
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
  const CardMemberBronze({
    Key? key,
    required this.point,
    required this.name,
  }) : super(key: key);

  final double point;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      // width: 400,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient:
            LinearGradient(colors: [Color(0xFFDEC598), Color(0xFFBC9B68)]),
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
                    '${(point).toStringAsFixed(0)}pts',
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
