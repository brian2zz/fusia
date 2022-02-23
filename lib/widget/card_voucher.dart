import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/voucher/getVoucher.dart';

class CardVoucher extends StatelessWidget {
  // final int IdBanner;
  final AssetImage Banner;
  final int Poin;
  final String HargaVoucher;
  final bool Identity;
  const CardVoucher(
      {Key? key,
      // required this.IdBanner,
      required this.HargaVoucher,
      required this.Banner,
      required this.Identity,
      required this.Poin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle boldDesStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );

    TextStyle desStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );

    TextStyle BoldDesStyleRed = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    );

    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return getVoucher(
                  Banner: Banner, HargaVoucher: HargaVoucher, Poin: Poin);
            },
          ));
        },
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 15),
          height: 280,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Ink.image(
                      image: Banner,
                      height: 119.47.h,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 95.24.h,
                      right: 30.8.w,
                      child: Stack(
                        children: [
                          Container(
                            child: Center(
                              child: Text(
                                "${(Poin).toStringAsFixed(0)}pts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 12),
                      child: Column(
                        children: [
                          Text('Voucher Rp ${(HargaVoucher)}',
                              style: boldDesStyle),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'Valid until : ',
                            style: desStyle,
                            children: <TextSpan>[
                              TextSpan(
                                text: '06 Dec 2016',
                                style: BoldDesStyleRed,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 115, bottom: 20),
                        child: SizedBox(
                          width: 80.w,
                          height: 25.h,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(80, 36, 35, 1)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        side: BorderSide(
                                          color: // color:
                                              Color.fromRGBO(80, 36, 35, 1),
                                        )))),
                            onPressed: () {
                              // Respond to button press
                            },
                            child: Text(
                                (Identity == true) ? 'Get Voucher' : 'Pakai',
                                style: TextStyle(fontSize: 10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
