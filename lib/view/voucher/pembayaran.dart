import 'package:flutter/material.dart';
import 'package:fusia/view/voucher/appBar.dart';
import 'package:fusia/view/voucher/voucher_page.dart';
import 'package:fusia/view/voucher/sukses.dart';

class pembayaran extends StatelessWidget {
  final AssetImage Banner;
  final int Poin;
  final String HargaVoucher;

  const pembayaran({
    Key? key,
    required this.HargaVoucher,
    required this.Banner,
    required this.Poin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _VoucherDetail() => Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            // elevation: 5,
            margin: EdgeInsets.all(10),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Ink.image(
                      image: Banner,
                      height: 100,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kampoeng Timbel",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Voucher Rp $HargaVoucher",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Valid until 29 Dec 2021",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "$Poin pts",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      IncrementDecrement(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

    Widget _PointBar() => Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 65,
          decoration: BoxDecoration(color: Color.fromRGBO(80, 36, 35, 1)),
          child: Row(children: [
            Text("Your Points Now", style: TextStyle(color: Colors.white)),
            SizedBox(width: 150),
            Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(36))),
                  width: 100.0,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset("assets/icons/ic_point.png"),
                      SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: '15',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                                text: ' pts',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        );
    Widget _Point() => Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total points :"),
              Text("30 pts"),
            ],
          ),
        );

    Widget _AmbilVoucherButton() => Container(
          height: 50,
          width: 500,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Sukses();
                },
              ));
            },
            child: Text('Ambil Voucher',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        );

    return Scaffold(
      appBar: app_bar(title: "Voucher to be Claimed"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PointBar(),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text("Voucher Details",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          SizedBox(height: 40),
          _VoucherDetail(),
          SizedBox(height: 50),
          Container(
              width: 380,
              height: 2,
              decoration: BoxDecoration(color: Colors.grey[200])),
          SizedBox(height: 50),
          _Point(),
          SizedBox(
            height: 250,
          ),
          _AmbilVoucherButton()
        ],
      ),
    );
  }
}

class IncrementDecrement extends StatefulWidget {
  IncrementDecrement({Key? key}) : super(key: key);

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  @override
  int counter = 0;
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 80),
        child: Container(
          // padding:
          //     EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          height: 25,
          decoration: BoxDecoration(
            border:
                Border.all(width: 2.0, color: Color.fromRGBO(80, 36, 35, 1)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    (counter >= 1)
                        ? setState(() {
                            counter--;
                          })
                        : null;
                  },
                  child: Container(
                    height: 35,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.remove,
                      color: Colors.black,
                      size: 16,
                    ),
                  )),
              Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 15),
                // margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(width: 2, color: Colors.black),
                    left: BorderSide(width: 2, color: Colors.black),
                  ),
                  // borderRadius: BorderRadius.circular(10),
                ),

                child: Center(
                  child: Text(
                    "$counter",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
