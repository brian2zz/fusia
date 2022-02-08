import 'package:flutter/material.dart';

class app_bar extends StatelessWidget implements PreferredSizeWidget {
  const app_bar({
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
        "Account Information",
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
