// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fusia/controller/login_controller.dart';
// import 'package:fusia/controller/voucher_controller.dart';
// import 'package:fusia/model/voucher_model.dart';
// import 'package:fusia/view/voucher/appBar.dart';
// import 'package:fusia/widget/card_voucher.dart';
// import 'package:fusia/widget/custom_appbar.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';

// class VoucherPage extends StatefulWidget {
//   VoucherPage({Key? key}) : super(key: key);

//   @override
//   State<VoucherPage> createState() => _VoucherPageState();
// }

// class _VoucherPageState extends State<VoucherPage> {
//   //controller
//   LoginController? userController;
//   VoucherController? voucherController;

//   Future? _loadData;

//   //global variable
//   var userToken;
//   var customerId;
//   var idVoucher;
//   var nilaiRp;
//   var tanggalAkhir;
//   // var

//   TextStyle headerStyle = TextStyle(
//     fontFamily: 'Poppins',
//     fontSize: 15.sp,
//     fontWeight: FontWeight.w700,
//     color: Color.fromRGBO(80, 36, 35, 1),
//   );

//   initState() {
//     super.initState();

//     initConstructor();
//     initData();
//   }

//   initConstructor() {
//     userController = Get.put(LoginController());
//     voucherController = Get.put(VoucherController());

//     // userToken = "".obs;
//     customerId = "".obs;
//     idVoucher = "".obs;
//     nilaiRp = "".obs;
//     tanggalAkhir = "".obs;
//   }

//   initData() async {
//     await userController!.retrieveUserLocalData();

//     setState(() {
//       // userToken.value = LoginController.userToken.value;
//       customerId.value = LoginController.customerId.value;

//       _loadData = retrieveVoucher(customerId.value);
//     });
//   }

//   retrieveVoucher(customerId) async {
//     var result = await voucherController!.retrieveVoucher(customerId);

//     setState(() {
//       if (result['status'] == 200) {
//         // VoucherModel responsedata =
//         // VoucherModel.fromJson(result['details']);
//         return result['details'];
//         // nilaiRp.value = responsedata.nilaiRp;
//         // tanggalAkhir.value = responsedata.tanggalAkhir;
//       }
//     });
//   }
//   // getData() async {
//   //   return responsedata
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: app_bar(title: "Voucher"),
//         body: Column(
//           children: <Widget>[
//             // the tab bar with two items
//             SizedBox(
//               height: 70,
//               child: TabBar(
//                 indicatorColor: Color.fromARGB(255, 230, 122, 11),
//                 labelColor: Color.fromARGB(255, 80, 36, 35),
//                 unselectedLabelColor: Colors.black,
//                 tabs: [
//                   Tab(
//                     child: Text("Vouchers to be Claimed",
//                         textAlign: TextAlign.center, style: headerStyle),
//                   ),
//                   Tab(
//                     child: Text("Voucher",
//                         textAlign: TextAlign.center, style: headerStyle),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 children: [
//                   // first tab bar view widget
//                   Container(
//                     height: 500,
//                     color: Colors.white,
//                     child: ListView(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(top: 20),
//                           child: FutureBuilder(
//                             future: retrieveVoucher(customerId),
//                             builder: (context, AsyncSnapshot snapshot) {
//                               if (snapshot.hasData) {
//                                 var result = snapshot.data['result'];
//                                 return ListView.builder(
//                                   itemCount: 200,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return CardVoucher(
//                                         HargaVoucher: "50.000",
//                                         Poin: 30,
//                                         Banner: AssetImage(
//                                             'assets/images/banner1.png'),
//                                         Identity: true);
//                                   },
//                                 );
//                               } else {
//                                 return Center(
//                                   child: CircularProgressIndicator(),
//                                 );
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // second tab bar view widget
//                   Container(
//                     height: 500,
//                     color: Colors.white,
//                     child: ListView(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(top: 20),
//                           child: CardVoucher(
//                               HargaVoucher: "50.000",
//                               Poin: 20,
//                               Banner: AssetImage('assets/images/banner1.png'),
//                               Identity: false),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
