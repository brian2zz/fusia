import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/view/voucher/appBar.dart';
import 'package:fusia/widget/card_voucher.dart';
import 'package:fusia/widget/custom_appbar.dart';

class voucher extends StatefulWidget {
  voucher({Key? key}) : super(key: key);

  @override
  State<voucher> createState() => _voucherState();
}

class _voucherState extends State<voucher> {
  TextStyle headerStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(80, 36, 35, 1),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: app_bar(title: "Voucher"),
        body: Column(
          children: <Widget>[
            // the tab bar with two items
            SizedBox(
              height: 70,
              child: TabBar(
                indicatorColor: Color.fromARGB(255, 230, 122, 11),
                labelColor: Color.fromARGB(255, 80, 36, 35),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text("Vouchers to be Claimed",
                        textAlign: TextAlign.center, style: headerStyle),
                  ),
                  Tab(
                    child: Text("Voucher",
                        textAlign: TextAlign.center, style: headerStyle),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [

                  // first tab bar view widget
                  Container(
                    height: 500,
                    color: Colors.white,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: CardVoucher(
                              HargaVoucher: "50.000",
                              Poin: 30,
                              Banner: AssetImage('assets/images/banner1.png'),
                              Identity: true),
                        ),
                        CardVoucher(
                            HargaVoucher: "50.000",
                            Poin: 30,
                            Banner: AssetImage('assets/images/banner2.png'),
                            Identity: true),
                        CardVoucher(
                            HargaVoucher: "50.000",
                            Poin: 30,
                            Banner: AssetImage('assets/images/banner3.png'),
                            Identity: true),
                      ],
                    ),
                  ),

                  // second tab bar view widget
                  Container(
                    height: 500,
                    color: Colors.white,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: CardVoucher(
                              HargaVoucher: "50.000",
                              Poin: 20,
                              Banner: AssetImage('assets/images/banner1.png'),
                              Identity: false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
