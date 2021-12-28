import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/header_circle.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({Key? key}) : super(key: key);

  @override
  _HomeDashboardPageState createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  CarouselController controllerPromo = CarouselController();

  TextStyle headerStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: ColorsTheme.white,
  );

  TextStyle dashboardStatusTextStyle(isTitle) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: (isTitle) ? 9.sp : 14.sp,
        fontWeight: (isTitle) ? FontWeight.w300 : FontWeight.w400,
        color: (isTitle) ? ColorsTheme.lightGrey : ColorsTheme.black,
      );

  TextStyle contentStyle2 = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsTheme.black,
  );

  TextStyle itemRewardTextStyle(isTitle) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: (isTitle) ? 14.sp : 12.sp,
        fontWeight: FontWeight.w600,
        color: ColorsTheme.black,
      );

  TextStyle itemRewardTextStyle2(isButtonStyle) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: (isButtonStyle) ? FontWeight.w500 : FontWeight.w600,
        fontSize: 10.sp,
        color: ColorsTheme.white,
      );

  TextStyle itemProductTextStyle(isDetailButton) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: (isDetailButton) ? FontWeight.w500 : FontWeight.w400,
        fontSize: (isDetailButton) ? 10.sp : 9.sp,
        color: ColorsTheme.primary,
      );

  scrollboard(value) {
    setState(() {
      _currentPageNotifier.value = value;
      //count = value;
      controllerPromo.jumpToPage(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    //HEADER WIDGET
    Widget headerBackground() => const HeaderCircle(diameter: 500);

    //ACCOUNT DISPLAY WIDGET
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

    //STATUS DASHBOARD WIDGET
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
            (status == "point")
                ? Row(
                    children: [
                      Text("1000", style: dashboardStatusTextStyle(false)),
                      SizedBox(width: 7.w),
                      Text("Points", style: dashboardStatusTextStyle(true)),
                    ],
                  )
                : Text("Rp. 52.000", style: dashboardStatusTextStyle(false)),
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

    //CAROUSEL PROMO WIDGET
    List<Widget> bannerItemsCustom = [
      Container(
        padding: EdgeInsets.only(right: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset('assets/images/banner1.png'),
            ),
          ],
        ),
      ),
      Container(
        width: 335.w,
        padding: EdgeInsets.only(right: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset('assets/images/banner2.png'),
            ),
          ],
        ),
      ),
      Container(
        width: 335.w,
        padding: EdgeInsets.only(right: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset('assets/images/banner3.png'),
            ),
          ],
        ),
      ),
    ];

    Widget carouselPromo() => CarouselSlider(
          carouselController: controllerPromo,
          options: CarouselOptions(
            autoPlay: true,
            onPageChanged: (index, reason) => scrollboard(index),
          ),
          items: bannerItemsCustom,
        );

    Widget dotIndicator() => CirclePageIndicator(
          itemCount: bannerItemsCustom.length,
          currentPageNotifier: _currentPageNotifier,
          selectedDotColor: ColorsTheme.primary,
          dotColor: Colors.grey,
        );

    //REWARD WIDGET
    Widget rewardContentsCardWidget() => Column(
          children: [
            ClipRRect(
              child: Image.asset('assets/images/dummy_reward.png',
                  fit: BoxFit.cover, width: 266.w),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                    left: 11.w,
                    bottom: 11.h,
                    right: 11.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 17.h,
                        child:
                            Image.asset('assets/images/logo_onboarding_2.png'),
                      ),
                      SizedBox(height: 22.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Voucher Rp 50.000",
                            style: itemRewardTextStyle(false),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23.r),
                            ),
                            color: ColorsTheme.primary,
                            child: InkWell(
                              onTap: () {},
                              splashColor: ColorsTheme.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 7.h),
                                child: Text("Ambil Coupon",
                                    style: itemRewardTextStyle2(true)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );

    Widget rewardPointsCardWidget() => Positioned(
          child: Container(
            height: 58.h,
            width: 58.w,
            child: CircleAvatar(
              backgroundColor: ColorsTheme.lightRed!,
              child: Padding(
                padding: EdgeInsets.fromLTRB(11.w, 11.h, 12.w, 11.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("30", style: itemRewardTextStyle2(false)),
                    Text("point", style: itemRewardTextStyle2(false)),
                  ],
                ),
              ),
            ),
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(color: ColorsTheme.white!, width: 2.w),
              ),
            ),
          ),
          top: 61.h,
          right: 20.w,
        );

    Widget itemRewardList() => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: ColorsTheme.primary!.withOpacity(0.14),
              width: 1.w,
            ),
          ),
          child: SizedBox(
            width: 266.w,
            child: Stack(
              children: [
                rewardContentsCardWidget(),
                rewardPointsCardWidget(),
              ],
            ),
          ),
        );

    Widget rewardList() => Padding(
          padding: EdgeInsets.only(
            bottom: 5.h,
          ),
          child: SizedBox(
            height: 200.h,
            child: ListView.builder(
              itemCount: 100,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (content, index) => Container(
                margin: EdgeInsets.only(left: 20.w),
                child: itemRewardList(),
              ),
            ),
          ),
        );

    //PRODUCT WIDGET
    Widget brandingIcon() => Positioned(
          child: Container(
            height: 26.h,
            width: 26.w,
            child: CircleAvatar(
              backgroundColor: ColorsTheme.white!,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.w, 8.h, 3.w, 7.h),
                child: SizedBox(
                  width: 19.w,
                  height: 11.h,
                  child: Image.asset('assets/images/logo_onboarding_2.png'),
                ),
              ),
            ),
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(color: ColorsTheme.lightYellow!, width: 2.w),
              ),
            ),
          ),
          top: 101.h,
          right: 15.w,
        );

    Widget contentItemProduct() => Column(
          children: [
            SizedBox(
              width: 158.w,
              height: 116.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/dummy_product.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 25.h, 21.w, 7.h),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet elit volutpat et massa,",
                style: itemProductTextStyle(false),
              ),
            ),
            Divider(
              color: ColorsTheme.primary!.withOpacity(0.14),
              height: 1.h,
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              splashColor: ColorsTheme.primary!.withOpacity(0.14),
              child: Container(
                padding: EdgeInsets.only(top: 7.w, bottom: 11.h),
                child: Center(
                  child: Text("Details", style: itemProductTextStyle(true)),
                ),
              ),
            ),
          ],
        );

    Widget itemProduct() => Container(
          width: 158.w,
          child: Stack(
            children: [
              contentItemProduct(),
              brandingIcon(),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: ColorsTheme.primary!.withOpacity(0.14),
              width: 1.w,
            ),
          ),
        );

    Widget productList() => Padding(
          padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
          child: SizedBox(
            height: 239.h,
            child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: itemProduct(),
              ),
            ),
          ),
        );

    //MAIN DASHBOARD WIDGET
    Widget content() => Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    headerBackground(),
                    Positioned(
                      child: headerUsername(),
                      top: 38.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    Positioned(
                      child: cardStatus(),
                      top: 103.h,
                      left: 20.w,
                      right: 20.w,
                    ),
                    Positioned(
                      child: carouselPromo(),
                      top: 288.h,
                      left: 0.w,
                      right: 0.w,
                    ),
                    Positioned(
                      child: dotIndicator(),
                      top: 444.h,
                      left: 0.w,
                      right: 0.w,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 46.h, 20.w, 9.53.h),
                  child:
                      Text("Reward Cataloge", style: itemRewardTextStyle(true)),
                ),
                rewardList(),
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 33.h, 20.w, 13.h),
                  child: Text("What's on", style: itemRewardTextStyle(true)),
                ),
                productList(),
              ],
            ),
          ),
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: content(),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}
