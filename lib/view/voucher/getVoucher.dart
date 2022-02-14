import 'package:flutter/material.dart';
import 'package:fusia/view/voucher/pembayaran.dart';
//simport 'package:fusia/view/voucher/tes.dart';
import 'package:fusia/view/voucher/bar.dart';

class getVoucher extends StatefulWidget {
  getVoucher({Key? key}) : super(key: key);

  @override
  State<getVoucher> createState() => _getVoucherState();
}

class _getVoucherState extends State<getVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(title: "Voucher Rp50.000"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Ink.image(
                  image: AssetImage('assets/images/banner3.png'),
                  height: 205,
                  // width: 377.7,
                  fit: BoxFit.cover,
                ),
                // Positioned(
                //   bottom: 16,
                //   right: 16,
                //   left: 16,
                //   child:
                // ),

                Padding(
                  padding: const EdgeInsets.only(top: 175, left: 325),
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "30 point",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                          color: Colors.red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Container(
                    child: Image.asset("assets/images/logo_onboarding_2.png"),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(236, 184, 63, 1),
                        style: BorderStyle.solid,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Kampoeng Timbel"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 2, decoration: BoxDecoration(color: Colors.grey[200])),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Voucher Rp 50.000',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16).copyWith(bottom: 0),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Periode: ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          children: const <TextSpan>[
                            TextSpan(
                                text: '28 Nov 2021 - 01 Dec 2021',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Description",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(80, 36, 35, 1))),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
                height: 5,
                decoration:
                    BoxDecoration(color: Color.fromRGBO(230, 122, 11, 1))),
            SizedBox(height: 10),
            SizedBox(height: 10),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nibh fusce arcu, nunc dictum nisi, eu. Vulputate et fermentum pulvinar platea adipiscing id. Enim feugiat eget a aliquet orci adipiscing eu. Blandit pellentesque adipiscing imassa condimentum. Enim sed consectetur odio imperdiet platea turpis diam, eu, in.",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700])),
              ),
            ),
            SizedBox(height: 50),
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
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return pembayaran();
                      },
                    ));
                  },
                  child: Text('Ambil Voucher',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
