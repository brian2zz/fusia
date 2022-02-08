import 'package:flutter/material.dart';
class textField extends StatelessWidget {
  final String Hint;
  const textField({
    Key? key,
    required this.Hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock_outlined,
          color: Color.fromARGB(255, 144, 152, 177),
        ),
        hintText: Hint,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 144, 152, 177),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
      ),
      style: TextStyle(
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;
  const Label({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}
