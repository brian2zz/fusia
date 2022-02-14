  import 'package:flutter/material.dart';
  import 'package:flutter/services.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:fusia/color/colors_theme.dart';
  import 'package:fusia/controller/login_controller.dart';
  import 'package:fusia/widget/custom_appbar.dart';
  import 'package:fusia/widget/custom_toast.dart';
  import 'package:get/get.dart';

  class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
  }

  class _AccountPageState extends State<AccountPage> {

  //controller
  LoginController? controller;

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
  void initState() {
    super.initState();
    initConstructor();
  }

  initConstructor() {
    controller = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {

    Widget itemMenuList(context,status) => SizedBox(
        height: 60.h,
        child: InkWell(
          onTap: () {
            if(status == "account") {
              Navigator.pushNamed(context, '/editaccount');
            } else if(status == "membership") {
              Navigator.pushNamed(context, '/membership');
            } else if(status == "exit") {
              setState(() {
                controller!.clearData();
                Navigator.pushReplacementNamed(context, '/login');
              });
            } else {
              showToast(context, "Fitur masih dalam tahap pengembangan");
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    (status == "account") 
                    ? 'assets/icons/ic_menu_account.png' 
                      : (status == "membership") 
                      ? 'assets/icons/ic_menu_reward.png' 
                        : (status == "promo") 
                        ? 'assets/icons/ic_menu_promo.png' 
                          : 'assets/icons/ic_keluar.png',
                    color: Colors.blue.shade800,
                  ),
                  SizedBox(
                    width: 15.h,
                  ),
                  Text(
                    (status == "account") 
                    ? "Account Information" 
                      : (status == "membership") 
                      ? "Membership" 
                        : (status == "promo") 
                        ? "Benefit" 
                          : "Exit",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              SizedBox(
                width: 20.w,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      );

    Widget _buildMenu(context) => Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        itemMenuList(context,"account"),
        itemMenuList(context,"membership"),
        itemMenuList(context,"promo"),
        itemMenuList(context,"exit"),
      ]),
    );

    Widget LayerComponentCard2() => Transform.translate(
      offset: const Offset(30,0.0),
      child: Stack(
        children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bronze",
                  style: TextStyle(
                      color: ColorsTheme.brown,
                      fontSize: 18.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "150 pts",
                  style: TextStyle(
                      color: ColorsTheme.whiteCream,
                      fontSize: 12.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            left: 0.w,
            top: 24.h,
          ),
          Positioned(
            child: SizedBox(
              height: 37.h,
              width: 37.w,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/icons/ic_medal.png'),
              ),
            ),
            right: 56.w,
            top: 24.h,
          ),
          Positioned(
            child: Text(
              "Jono Maximum",
              style: TextStyle(
                  color: ColorsTheme.whiteCream,
                  fontSize: 14.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
              ),
            ),
            bottom: 19.h,
            left: 0.w,
          ),
        ],
      ),
    );

    Widget LayerComponentCard1() => Positioned(
      child: Transform.translate(
        offset: const Offset(-30,0.0),
        child: SizedBox(
          width: 120.w,
          height: 145.h,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/images/mascot.png'),
            ),
          ),
        ),
      ),
      right: -29.w,
      bottom: -38.h,
    );

    Widget componentCard() => Stack(
      children: [
        LayerComponentCard2(),
        LayerComponentCard1(),
      ],
    );

    Widget _buildCard() => Container(
      height: 192.h,
      width: 335.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        gradient: const LinearGradient(colors: [Color(0xFFDEC598), Color(0xFFBC9B68)]),
      ),
      child: componentCard(),
    );

    Widget _avatarProfile() => Container(
      margin: EdgeInsets.fromLTRB(0.w, 10.0.h, 50.0.w, 20.0.h),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 25.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage("assets/images/mascot.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.0.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Jono Maximus Gold",
                        style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "@jono",
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 12.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    
    Widget contentbody(context) => Expanded(
      child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.h),
                _avatarProfile(),
                SizedBox(height: 5.h),
                _buildCard(),
                SizedBox(height: 40.h),
                Container(
                  height: 10,
                  decoration: BoxDecoration(color: ColorsTheme.lightGrey2),
                ),
                SizedBox(height: 20.h),
                _buildMenu(context),
              ],
            ),
          ),
        ),
      );


    Widget body(context) => Column(
      children: [
        CustomAppBar(title: "Account", isAccessDetail: false),
        contentbody(context),
      ],
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: body(context),
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}

  
