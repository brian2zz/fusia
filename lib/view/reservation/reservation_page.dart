import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/view/account/change_password_page.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:intl/intl.dart';

InputDecoration tamu = InputDecoration(
  prefixIcon: Icon(
    Icons.person_outline,
    color: Color.fromARGB(255, 144, 152, 177),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
  ),
  border: new OutlineInputBorder(
      borderSide: new BorderSide(
    color: Color.fromARGB(255, 235, 240, 255),
  )),
  hintText: 'Estimasi Jumlah Tamu',
  hintStyle: TextStyle(
    color: Color.fromARGB(255, 144, 152, 177),
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  ),
);
InputDecoration outlet = InputDecoration(
  prefixIcon: Icon(
    Icons.place_outlined,
    color: Color.fromARGB(255, 144, 152, 177),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
  ),
  border: new OutlineInputBorder(
      borderSide: new BorderSide(
    color: Color.fromARGB(255, 235, 240, 255),
  )),
  hintText: 'outlet',
  hintStyle: TextStyle(
    color: Color.fromARGB(255, 144, 152, 177),
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
  ),
);
TextStyle textFormStyle = TextStyle(
  color: Color.fromARGB(
    255,
    2,
    2,
    2,
  ),
  fontWeight: FontWeight.bold,
  fontSize: 12.sp,
  fontFamily: 'Poppins',
);

class reservation extends StatefulWidget {
  const reservation({Key? key}) : super(key: key);

  @override
  _reservationState createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  DateTime? date;
  TimeOfDay? time;

  String dateReservation() {
    if (date == null) {
      return '';
    } else {
      return DateFormat('dd-MMMM-yyyy').format(date!);
    }
  }

  String timeReservation() {
    if (time == null) {
      return '';
    } else {
      return '${time!.hour}:${time!.minute} WIB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Reservation"),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _formReservation(context),
          SizedBox(height: 20),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Color.fromARGB(255, 80, 36, 35),
                onPressed: () {},
                child: Text(
                  'Make Reservation',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formReservation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        formDateTime(
          press: () => PickDate(context),
          text: dateReservation(),
          icon: Icons.date_range_outlined,
          hint: 'tanggal',
        ),
        SizedBox(height: 10),
        formDateTime(
          press: () => PickTime(context),
          text: timeReservation(),
          icon: Icons.access_time,
          hint: 'pukul',
        ),
        SizedBox(height: 10),
        _formGuest(),
        SizedBox(height: 10),
        _formOutlet(),
        SizedBox(height: 50),
        Text(
          'Menu',
          style: textFormStyle,
        ),
        _formMenu(),
        SizedBox(height: 10),
        _formDescription(),
      ],
    );
  }

  Widget _formDescription() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
        hintText: 'Keterangan',
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 144, 152, 177),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      minLines: 10,
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }

  Widget _formMenu() {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
        hintText: 'Menu',
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 144, 152, 177),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _formOutlet() {
    return TextFormField(
      decoration: outlet,
      style: textFormStyle,
    );
  }

  Widget _formGuest() {
    return TextFormField(
      decoration: tamu,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      style: textFormStyle,
    );
  }

  Future PickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() => date = newDate);
  }

  Future PickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: time ?? initialTime);
    if (newTime == null) return;
    setState(() => time = newTime);
  }
}

class formDateTime extends StatelessWidget {
  final VoidCallback press;
  final String text;
  final IconData icon;
  final String hint;
  const formDateTime({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: press,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Color.fromARGB(255, 144, 152, 177),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
        hintText: hint,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 144, 152, 177),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      controller: TextEditingController(text: text),
      style: textFormStyle,
    );
  }
}
