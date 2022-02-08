import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
        ),
        SizedBox(width: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nathasya Maria Simandjuntak',
              style: TextStyle(
                color: Color.fromARGB(255, 34, 50, 99),
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '@Nathasya',
              style: TextStyle(
                color: Color.fromARGB(255, 144, 152, 177),
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CardMember extends StatelessWidget {
  const CardMember({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            height: 240,
            // width: 400,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                  colors: [Color(0xFFDEC598), Color(0xFFBC9B68)]),
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
                          "150 pts",
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
                  "Nathasya Maria Simandjuntak",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900),
                ),
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   child: Image.asset(
                //     'assets/images/mascot.png',
                //     color: Colors.white.withOpacity(0.8),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback press;
  const ListMenu({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Image.asset(image, color: Color.fromARGB(255, 34, 50, 99)),
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 34, 50, 99),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
