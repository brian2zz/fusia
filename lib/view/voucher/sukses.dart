import 'package:flutter/material.dart';
import 'package:fusia/view/voucher/appBar.dart';
import 'package:fusia/view/voucher/pembayaran.dart';

class Sukses extends StatefulWidget {
  Sukses({Key? key}) : super(key: key);

  @override
  State<Sukses> createState() => _SuksesState();
}

class _SuksesState extends State<Sukses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 400),
          Icon(
            Icons.check_circle_rounded,
            size: 100,
            color: Colors.green,
          ),
          Center(
              child: Text(
            "Success",
            style: TextStyle(
                color: Color.fromRGBO(34, 50, 99, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          )),
          Center(child: Text("See you at our outlets")),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(80, 36, 35, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            side: BorderSide(
                      color: // color:
                          Color.fromRGBO(80, 36, 35, 1),
                    )))),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return pembayaran(Banner: Banner, HargaVoucher: HargaVoucher, Poin: Poin,);
                  //   },
                  // ));
                },
                child: Text('See My Voucher',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
