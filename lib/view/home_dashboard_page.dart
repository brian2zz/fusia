import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/header_circle.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({Key? key}) : super(key: key);

  @override
  _HomeDashboardPageState createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  TextStyle headerStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: ColorsTheme.white,
  );

  TextStyle contentStyle1 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.black,
  );

  TextStyle contentStyle2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsTheme.black,
  );

  @override
  Widget build(BuildContext context) {
    Widget bodyContent() => const HeaderCircle(diameter: 500);

    Widget headerUsername() => SizedBox(
          width: ScreenUtil().screenWidth,
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hi Jono", style: headerStyle),
                  Text("Silver Member", style: headerStyle),
                  SizedBox(height: 15.h),
                ],
              ),
              Image.asset(
                'assets/images/mascot.png',
                width: 82.w,
                height: 99.h,
              ),
            ],
          ),
        );

    Widget mainStatus(status) => Row(
          children: [
            SizedBox(
              width: 20.83.w,
              height: 18.75.h,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset((status == "point")
                    ? 'assets/icons/ic_point.png'
                    : 'assets/icons/ic_wallet.png'),
              ),
            ),
            SizedBox(width: 10.08.w),
            Text((status == "point") ? "1000 points" : "Rp. 52.000",
                style: contentStyle1),
          ],
        );

    Widget iconMenu(status) => InkWell(
          onTap: () {},
          child: Column(
            children: [
              SizedBox(
                width: 45.w,
                height: 45.h,
                child: Image.asset((status == "coupon")
                    ? 'assets/icons/ic_my_coupon.png'
                    : (status == "delivery")
                        ? 'assets/icons/ic_delivery.png'
                        : 'assets/icons/ic_transaksi.png'),
              ),
              SizedBox(height: 5.h),
              Text(
                (status == "coupon")
                    ? "My Coupon"
                    : (status == "delivery")
                        ? "Delivery"
                        : "Transaksi",
                style: contentStyle2,
              ),
            ],
          ),
        );

    Widget cardStatus() => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
                color: ColorsTheme.primary!.withOpacity(0.14), width: 1.w),
          ),
          color: ColorsTheme.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mainStatus(""),
                    SizedBox(
                      height: 43.h,
                      child: VerticalDivider(
                        color: ColorsTheme.primary!.withOpacity(0.14),
                        thickness: 1.w,
                      ),
                    ),
                    mainStatus("point"),
                  ],
                ),
                SizedBox(height: 8.h),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Divider(
                    color: ColorsTheme.primary!.withOpacity(0.14),
                    thickness: 1.w,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    iconMenu("coupon"),
                    iconMenu("delivery"),
                    iconMenu(""),
                  ],
                )
              ],
            ),
          ),
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              bodyContent(),
              Positioned(
                child: headerUsername(),
                left: 20.w,
                right: 20.w,
                top: 38.h,
              ),
              Positioned(
                child: cardStatus(),
                top: 103.h,
                left: 20.w,
                right: 20.w,
              ),
            ],
          ),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}
