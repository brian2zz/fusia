import 'package:flutter/material.dart';
// import 'package:fusia/view/voucher/tes.dart';
import 'package:fusia/view/voucher/bar.dart';
import 'getVoucher.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app_bar(title: "Voucher"),
      body: Container(
        child: DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 70,
                    child: TabBar(
                      indicatorColor: Color.fromARGB(255, 230, 122, 11),
                      labelColor: Color.fromARGB(255, 80, 36, 35),
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text("Vouchers to be Claimed",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15)
                              // style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                        ),
                        Tab(
                          child: Text("Voucher"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                        height: 619, //height of TabBarView
                        child: TabBarView(children: <Widget>[
                          ListView(children: <Widget>[
                            Column(
                              children: [
                                // Text('Display Tab 1',
                                //     style: TextStyle(
                                //         fontSize: 22,
                                //         fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return getVoucher();
                                        },
                                      ));
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Column(
                                        children: [
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Ink.image(
                                                image: AssetImage(
                                                    'assets/images/banner3.png'),
                                                height: 119.47,
                                                // width: 377.7,
                                                fit: BoxFit.cover,
                                              ),
                                              // Positioned(
                                              //   bottom: 16,
                                              //   right: 16,
                                              //   left: 16,
                                              //   child:
                                              // ),

                                              Positioned(
                                                top: 86.24,
                                                right: 49.8,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Text(
                                                        "30 point",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      width: 56,
                                                      height: 56,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          width: 2,
                                                          color: Colors.white,
                                                          style:
                                                              BorderStyle.solid,
                                                        ),
                                                        color: Colors.red,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black26,
                                                            blurRadius: 8.0,
                                                            offset: Offset(
                                                                0.0, 5.0),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(16)
                                                    .copyWith(bottom: 0),
                                                child: Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: 'Valid until : ',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black,
                                                        ),
                                                        children: const <
                                                            TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  '06 Dec 2016',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .red)),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 90),
                                                      child: SizedBox(
                                                        width: 98,
                                                        height: 28,
                                                        child: ElevatedButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Color.fromRGBO(
                                                                          80,
                                                                          36,
                                                                          35,
                                                                          1)),
                                                              shape: MaterialStateProperty.all<
                                                                      RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              18.0),
                                                                      side:
                                                                          BorderSide(
                                                                        color: // color:
                                                                            Color.fromRGBO(
                                                                                80,
                                                                                36,
                                                                                35,
                                                                                1),
                                                                      )))),
                                                          onPressed: () {
                                                            // Respond to button press
                                                          },
                                                          child: Text(
                                                              'Get Voucher',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          // ButtonBar(
                                          //   alignment:
                                          //       MainAxisAlignment.start,
                                          //   children: [
                                          //     FlatButton(
                                          //       child: Text('Buy Cat'),
                                          //       onPressed: () {},
                                          //     ),
                                          //     FlatButton(
                                          //       child: Text('Buy Cat Food'),
                                          //       onPressed: () {},
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 250,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Ink.image(
                                              image: AssetImage(
                                                  'assets/images/banner3.png'),
                                              height: 119.47,
                                              // width: 377.7,
                                              fit: BoxFit.cover,
                                            ),
                                            // Positioned(
                                            //   bottom: 16,
                                            //   right: 16,
                                            //   left: 16,
                                            //   child:
                                            // ),

                                            Positioned(
                                              top: 86.24,
                                              right: 49.8,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      "30 point",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    width: 56,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        width: 2,
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                      color: Colors.red,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 8.0,
                                                          offset:
                                                              Offset(0.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(16)
                                                  .copyWith(bottom: 0),
                                              child: Row(
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'Valid until : ',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      children: const <
                                                          TextSpan>[
                                                        TextSpan(
                                                            text: '06 Dec 2016',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .red)),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 90),
                                                    child: SizedBox(
                                                      width: 98,
                                                      height: 28,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Color.fromRGBO(
                                                                            80,
                                                                            36,
                                                                            35,
                                                                            1)),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side:
                                                                        BorderSide(
                                                                      color: // color:
                                                                          Color.fromRGBO(
                                                                              80,
                                                                              36,
                                                                              35,
                                                                              1),
                                                                    )))),
                                                        onPressed: () {
                                                          // Respond to button press
                                                        },
                                                        child: Text(
                                                            'Get Voucher',
                                                            style: TextStyle(
                                                                fontSize: 10)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ButtonBar(
                                        //   alignment:
                                        //       MainAxisAlignment.start,
                                        //   children: [
                                        //     FlatButton(
                                        //       child: Text('Buy Cat'),
                                        //       onPressed: () {},
                                        //     ),
                                        //     FlatButton(
                                        //       child: Text('Buy Cat Food'),
                                        //       onPressed: () {},
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                          ListView(children: <Widget>[
                            Column(
                              children: [
                                // Text('Display Tab 1',
                                //     style: TextStyle(
                                //         fontSize: 22,
                                //         fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 32,
                                ),
                                SizedBox(
                                  height: 250,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Ink.image(
                                              image: AssetImage(
                                                  'assets/images/banner3.png'),
                                              height: 119.47,
                                              // width: 377.7,
                                              fit: BoxFit.cover,
                                            ),
                                            // Positioned(
                                            //   bottom: 16,
                                            //   right: 16,
                                            //   left: 16,
                                            //   child:
                                            // ),

                                            Positioned(
                                              top: 86.24,
                                              right: 49.8,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      "30 point",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    width: 56,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        width: 2,
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                      color: Colors.red,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 8.0,
                                                          offset:
                                                              Offset(0.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(16)
                                                  .copyWith(bottom: 0),
                                              child: Row(
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'Valid until : ',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      children: const <
                                                          TextSpan>[
                                                        TextSpan(
                                                            text: '06 Dec 2016',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .red)),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 90),
                                                    child: SizedBox(
                                                      width: 98,
                                                      height: 28,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Color.fromRGBO(
                                                                            80,
                                                                            36,
                                                                            35,
                                                                            1)),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side:
                                                                        BorderSide(
                                                                      color: // color:
                                                                          Color.fromRGBO(
                                                                              80,
                                                                              36,
                                                                              35,
                                                                              1),
                                                                    )))),
                                                        onPressed: () {
                                                          // Respond to button press
                                                        },
                                                        child: Text('Pakai',
                                                            style: TextStyle(
                                                                fontSize: 10)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ButtonBar(
                                        //   alignment:
                                        //       MainAxisAlignment.start,
                                        //   children: [
                                        //     FlatButton(
                                        //       child: Text('Buy Cat'),
                                        //       onPressed: () {},
                                        //     ),
                                        //     FlatButton(
                                        //       child: Text('Buy Cat Food'),
                                        //       onPressed: () {},
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 250,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Ink.image(
                                              image: AssetImage(
                                                  'assets/images/banner3.png'),
                                              height: 119.47,
                                              // width: 377.7,
                                              fit: BoxFit.cover,
                                            ),
                                            // Positioned(
                                            //   bottom: 16,
                                            //   right: 16,
                                            //   left: 16,
                                            //   child:
                                            // ),

                                            Positioned(
                                              top: 86.24,
                                              right: 49.8,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      "30 point",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    width: 56,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        width: 2,
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                      color: Colors.red,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 8.0,
                                                          offset:
                                                              Offset(0.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(16)
                                                  .copyWith(bottom: 0),
                                              child: Row(
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'Valid until : ',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      children: const <
                                                          TextSpan>[
                                                        TextSpan(
                                                            text: '06 Dec 2016',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .red)),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 90),
                                                    child: SizedBox(
                                                      width: 98,
                                                      height: 28,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Color.fromRGBO(
                                                                            80,
                                                                            36,
                                                                            35,
                                                                            1)),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side:
                                                                        BorderSide(
                                                                      color: // color:
                                                                          Color.fromRGBO(
                                                                              80,
                                                                              36,
                                                                              35,
                                                                              1),
                                                                    )))),
                                                        onPressed: () {
                                                          // Respond to button press
                                                        },
                                                        child: Text('Pakai',
                                                            style: TextStyle(
                                                                fontSize: 10)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ButtonBar(
                                        //   alignment:
                                        //       MainAxisAlignment.start,
                                        //   children: [
                                        //     FlatButton(
                                        //       child: Text('Buy Cat'),
                                        //       onPressed: () {},
                                        //     ),
                                        //     FlatButton(
                                        //       child: Text('Buy Cat Food'),
                                        //       onPressed: () {},
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 250,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Ink.image(
                                              image: AssetImage(
                                                  'assets/images/banner3.png'),
                                              height: 119.47,
                                              // width: 377.7,
                                              fit: BoxFit.cover,
                                            ),
                                            // Positioned(
                                            //   bottom: 16,
                                            //   right: 16,
                                            //   left: 16,
                                            //   child:
                                            // ),

                                            Positioned(
                                              top: 86.24,
                                              right: 49.8,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                      "30 point",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    width: 56,
                                                    height: 56,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        width: 2,
                                                        color: Colors.white,
                                                        style:
                                                            BorderStyle.solid,
                                                      ),
                                                      color: Colors.red,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 8.0,
                                                          offset:
                                                              Offset(0.0, 5.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(16)
                                                  .copyWith(bottom: 0),
                                              child: Row(
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      text: 'Valid until : ',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                      children: const <
                                                          TextSpan>[
                                                        TextSpan(
                                                            text: '06 Dec 2016',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .red)),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 90),
                                                    child: SizedBox(
                                                      width: 98,
                                                      height: 28,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Color.fromRGBO(
                                                                            80,
                                                                            36,
                                                                            35,
                                                                            1)),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                    side:
                                                                        BorderSide(
                                                                      color: // color:
                                                                          Color.fromRGBO(
                                                                              80,
                                                                              36,
                                                                              35,
                                                                              1),
                                                                    )))),
                                                        onPressed: () {
                                                          // Respond to button press
                                                        },
                                                        child: Text('Pakai',
                                                            style: TextStyle(
                                                                fontSize: 10)),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ButtonBar(
                                        //   alignment:
                                        //       MainAxisAlignment.start,
                                        //   children: [
                                        //     FlatButton(
                                        //       child: Text('Buy Cat'),
                                        //       onPressed: () {},
                                        //     ),
                                        //     FlatButton(
                                        //       child: Text('Buy Cat Food'),
                                        //       onPressed: () {},
                                        //     )
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        ])),
                  )
                ])),
      ),
    );
  }
}
