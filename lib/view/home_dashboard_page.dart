
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/controller/dashboard_controller.dart';
import 'package:fusia/controller/login_controller.dart';
import 'package:fusia/model/data_account_model.dart';
import 'package:fusia/widget/custom_toast.dart';
import 'package:fusia/widget/header_circle.dart';
import 'package:fusia/widget/product_widget.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({Key? key}) : super(key: key);

  @override
  _HomeDashboardPageState createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  
  //utils
  var _currentPageNotifier;
  CarouselController? controllerPromo;

  Future? _loadData;

  //controller
  LoginController? userController;
  DashboardController? dashboardController;

  //global variable
  var userToken;
  var customerId;
  var namaUser;
  var membershipUser;
  var pointUser;
  var photoUrlUser;

  TextStyle headerStyle(isSubHeader) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: (isSubHeader) ? 12.sp : 15.sp,
    fontWeight: (isSubHeader) ? FontWeight.w500 : FontWeight.w700,
    color: ColorsTheme.white,
  );

  TextStyle pointsHeaderTextStyle() => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
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

  TextStyle itemValidVoucherTextStyle(isValue) => TextStyle(
        fontFamily: 'Poppins',
        fontSize: 7.sp,
        fontWeight: (isValue) ? FontWeight.w400 : FontWeight.w600,
        color: (isValue) ? ColorsTheme.lightRed : ColorsTheme.black,
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
  
  TextStyle alertErrorTextStyle = TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: ColorsTheme.white,
      );

  @override
  initState() {
    super.initState();

    initConstructor();
    initData();
  }

  initConstructor() {
    controllerPromo = CarouselController();
    _currentPageNotifier = ValueNotifier<int>(0);

    userController = Get.put(LoginController());
    dashboardController = Get.put(DashboardController());

    userToken = "".obs;
    customerId = "".obs;
    namaUser = "".obs;
    membershipUser = "".obs;
    pointUser = "".obs;
    photoUrlUser = "".obs;
  }

  initData() async {
    await userController!.retrieveUserLocalData();

    setState(() {
      userToken.value = LoginController.userToken.value;
      customerId.value = LoginController.customerId.value;

      _loadData = retrieveHomeDashboard(userToken.value,customerId.value);
    });

  }

  retrieveHomeDashboard(token,customerId) async {

    var result = await dashboardController!.retrieveDashboard(token, customerId);

    setState(() {
      if(result['status'] == 200) {
        DataAccountModel responsedata = DataAccountModel.fromJson(result['details']['databody']);
        
        namaUser.value = responsedata.custNama;
        membershipUser.value = responsedata.custMembership;
      }
     
    });
  }

  scrollboard(value) {
    setState(() {
      _currentPageNotifier.value = value;
      //count = value;
      controllerPromo!.jumpToPage(value);
    });
  }

  Future refreshItem() async {
    setState(() {
      _loadData = retrieveHomeDashboard(userToken,customerId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //HEADER WIDGET
    Widget headerBackground() => const HeaderCircle(diameter: 500);

    //ACCOUNT DISPLAY WIDGET
    Widget headerUsername(statusLoading) {
      
      Widget loadingData(statusComponent) => Shimmer.fromColors(
        baseColor: ColorsTheme.lightBrown!,
        highlightColor: ColorsTheme.darkerBrown!,
        child: Container(
          width: (statusComponent == 1) ? 100.w : (statusComponent == 2) ? 60.w : (statusComponent == 3) ? 40.w : 50.w,
          height: 15.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: ColorsTheme.white,
          ),
        )
      );

      return SizedBox(
          width: ScreenUtil().screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 48.w,
                    height: 48.h,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: (statusLoading) ? const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/dummy_photo.png")
                        ) : Shimmer.fromColors(
                          child: CircleAvatar(backgroundColor: ColorsTheme.black), 
                          baseColor: ColorsTheme.lightBrown!, 
                          highlightColor: ColorsTheme.darkerBrown!,
                        )
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (statusLoading) ? [
                      Text(namaUser.value,style: headerStyle(false)),
                      Text("${membershipUser.value} Member", style: headerStyle(true)),
                    ] : [
                      loadingData(1),
                      SizedBox(height: 5.h),
                      loadingData(2),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: (statusLoading) ? [
                  Text("Point",style: pointsHeaderTextStyle()),
                  Text("1000",style: headerStyle(false)),
                ] : [
                  loadingData(3),
                  SizedBox(height: 5.h),
                  loadingData(4),
                ],
              ),
            ],
          ),
        );
    }

    //STATUS DASHBOARD WIDGET
    /*Widget mainStatus(status) => Row(
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
        );*/

    Widget cardStatus(isLoading) {

      Widget contentLoading() => Shimmer.fromColors(
        baseColor: ColorsTheme.lightBrown!,
        highlightColor: ColorsTheme.darkerBrown!,
        child: Container(
          width: 50.w,
          height: 65.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: ColorsTheme.white,
          ),
        )
      );

      Widget contentIcon(status) =>Column(
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
                ? "Vouchers"
                : (status == "delivery")
                    ? "Delivery"
                    : "Transaksi",
            style: contentStyle2,
          ),
        ],
      );

      Widget iconMenu(status,isLoading) => InkWell(
        onTap: () => (isLoading) ? (status == "coupon") ? Navigator.pushNamed(context, '/vouchers') : showToast(context, "Fitur ini dalam tahap pengembangan") : {},
        child: (isLoading) ? contentIcon(status) : contentLoading()
      );

      return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
                color: ColorsTheme.primary!.withOpacity(0.14), width: 1.w),
          ),
          color: ColorsTheme.white,
          child: Container(
            padding: EdgeInsets.fromLTRB(23.w, 31.h, 23.w, 30.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    iconMenu("coupon", isLoading),
                    iconMenu("delivery", isLoading),
                    iconMenu("", isLoading),
                  ],
                )
              ],
            ),
          ),
        );
    }

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

    Widget LatestPromoBanner(isLoading) {

      Widget contentLoadingBanner() => Shimmer.fromColors(
        baseColor: ColorsTheme.lightBrown!,
        highlightColor: ColorsTheme.darkerBrown!,
        child: Container(
          width: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsTheme.white,
          ),
        )
      );

      Widget contentLoadingList() => Container(
        height: 130.h,
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => Row(
            children: [
              SizedBox(width: 9.w),
              contentLoadingBanner(),
            ],
          ),
        ),
      );

      Widget carouselPromo() => CarouselSlider(
            carouselController: controllerPromo,
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) => scrollboard(index),
            ),
            items: bannerItemsCustom,
          );

      return Column(
        children: (isLoading) ? [
          carouselPromo(),
        ] : [
          contentLoadingList(),
        ],
      );
    }

    Widget dotIndicator() => CirclePageIndicator(
      itemCount: bannerItemsCustom.length,
      currentPageNotifier: _currentPageNotifier,
      selectedDotColor: ColorsTheme.primary,
      dotColor: Colors.grey,
    );

    //REWARD WIDGET
    Widget rewardList(isLoading) {

      Widget contentLoadingPromo() => Shimmer.fromColors(
        baseColor: ColorsTheme.lightBrown!,
        highlightColor: ColorsTheme.darkerBrown!,
        child: Container(
          width: 266.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsTheme.white,
          ),
        )
      );

      Widget contentLoadingList() => SizedBox(
        height: 130.h,
        child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) => Row(
            children: [
              SizedBox(width: 9.w),
              contentLoadingPromo(),
            ],
          ),
        ),
      );

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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Voucher Rp 50.000",
                              style: itemRewardTextStyle(false),
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: "Valid until : ",style: itemValidVoucherTextStyle(false)),
                                  TextSpan(text: "06 Dec 2022",style: itemValidVoucherTextStyle(true)),
                                ]
                              )
                            ),
                          ],
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

      return (isLoading) ? Padding(
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
      ) : contentLoadingList();
    }

    //PRODUCT WIDGET

    Widget productList(isLoading) {
      Widget itemProductLoading() => Shimmer.fromColors(
        baseColor: ColorsTheme.lightBrown!,
        highlightColor: ColorsTheme.darkerBrown!,
        child: Container(
          width: 158.w,
          height: 228.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsTheme.white,
          ),
        )
      );

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SizedBox(
        height: 228.h,
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: (isLoading) ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: (isLoading) ? const CustomItemCard(
              imageShopItem: 'assets/images/logo_onboarding_2.png',
              imageItem: 'assets/images/dummy_product.png',
              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet elit volutpat et massa,",
              isProductHome: true,
            ) : itemProductLoading(), 
          ),
        ),
      ),
    );
    }

    Widget contentLoadedData(statusLoading) => RefreshIndicator(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                headerBackground(),
                Positioned(
                  child: headerUsername(statusLoading),
                  top: 22.h,
                  left: 20.w,
                  right: 20.w,
                ),
                Positioned(
                  child: cardStatus(statusLoading),
                  top: 78.h,
                  left: 20.w,
                  right: 20.w,
                ),
                Positioned(
                  child: LatestPromoBanner(statusLoading),
                  top: 238.h,
                  left: 0.w,
                  right: 0.w,
                ),
                (statusLoading) ? Positioned(
                  child: dotIndicator(),
                  top: 389.h,
                  left: 0.w,
                  right: 0.w,
                ) : Container(),
              ],
            ),
            (statusLoading) ? Container(
              padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 9.53.h),
              child:
                  Text("Voucher to be Claimed", style: itemRewardTextStyle(true)),
            ) : SizedBox(height: 22.h),
            rewardList(statusLoading),
            (statusLoading) ? Container(
              padding: EdgeInsets.fromLTRB(20.w, 33.h, 20.w, 13.h),
              child: Text("What's on", style: itemRewardTextStyle(true)),
            ) : SizedBox(height: 33.h),
            productList(statusLoading),
          ],
        ),
      ), 
      onRefresh: refreshItem,
    );

    //MAIN DASHBOARD WIDGET
    Widget body() => FutureBuilder(
      future: _loadData,
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              var snackbar = SnackBar(
                content: Text("Data user gagal terupload. Pastikan jaringan internet dalam kondisi baik.", style: alertErrorTextStyle),
                backgroundColor: ColorsTheme.lightRed,
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            });

            return contentLoadedData(true);
          } else {
            return contentLoadedData(true);
          }
        }
        return contentLoadedData(false);
      }
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: body(),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}
