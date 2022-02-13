import 'package:flutter/material.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const appBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 34, 50, 99),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 144, 152, 177),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
