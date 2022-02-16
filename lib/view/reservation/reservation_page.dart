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
  hintText: 'Outlet',
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
  fontSize: 16.sp,
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

  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Reservation"),
      body: _body(context),
      bottomNavigationBar: _makeReservationButton(),
    );
  }

  Widget _makeReservationButton() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: SizedBox(
          height: 60.h,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 40.h),
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
      );

  Widget _body(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: new SingleChildScrollView(
          child: _formReservation(context),
        ),
      );

  Widget _formReservation(BuildContext context) {
    void _incrementCounter() {
      setState(() {
        value++;
      });
    }

    void _decrementCounter() {
      setState(() {
        value--;
      });
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60.h),
        formDateTime(
          press: () => PickDate(context),
          text: dateReservation(),
          icon: Icons.date_range_outlined,
          hint: 'Tanggal',
        ),
        SizedBox(height: 10.h),
        formDateTime(
          press: () => PickTime(context),
          text: timeReservation(),
          icon: Icons.access_time,
          hint: 'Pukul',
        ),
        SizedBox(height: 10.h),
        _formGuest(),
        SizedBox(height: 10.h),
        _formOutlet(),
        SizedBox(height: 50),
        Text(
          'Menu',
          style: textFormStyle,
        ),
        SizedBox(height: 20.h),
        _formMenu(),
        SizedBox(height: 20.h),
        _quantity(_decrementCounter, _incrementCounter),
        SizedBox(height: 20.h),
        _formDescription(),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _quantity(void _decrementCounter(), void _incrementCounter()) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'QTY',
            style: textFormStyle,
          ),
          Container(
            height: 35.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 80, 36, 35),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (value > 0) ? _decrementCounter : null,
                  child: Container(
                      height: 35.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(Icons.remove)),
                ),
                Text('${value}', style: TextStyle(color: Colors.white)),
                InkWell(
                  onTap: _incrementCounter,
                  child: Container(
                      height: 35.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(Icons.add)),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _formDescription() => TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
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

  Widget _formMenu() => TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
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

  Widget _formOutlet() => TextFormField(
        decoration: outlet,
        style: textFormStyle,
      );

  Widget _formGuest() => TextFormField(
        decoration: tamu,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: textFormStyle,
      );

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
