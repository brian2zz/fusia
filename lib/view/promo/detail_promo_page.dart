

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar.dart';

class DetailPromo extends StatefulWidget {
  
  @override
  DetailPromo({Key? key}) : super(key: key);

  _DetailPromoState createState() => _DetailPromoState();
}

class _DetailPromoState extends State<DetailPromo> {

  TextStyle contentStyle1(isDescription) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: (isDescription) ? 14.sp : 12.sp,
    color: ColorsTheme.primary,
  );

  TextStyle contentDescriptionTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsTheme.grey,
  );

  TextStyle productNameTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorsTheme.primary,
  );

  TextStyle periodValueTextStyle(isTitle) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10.sp,
    fontWeight: (isTitle) ? FontWeight.w400 : FontWeight.w500,
    color: (isTitle) ? ColorsTheme.primary : ColorsTheme.lightRed,
  );

  @override
  Widget build(BuildContext context) {
    
    Widget appbar() => CustomAppBar(title: "Promo: Hygienic Promo",isAccessDetail: true);
    
    Widget rowShop() => Row(
      children: [
        SizedBox(
          width: 36.w,
          height: 36.h,
          child: CircleAvatar(
            radius: 10.r,
            child: CircleAvatar(
              child: Image.asset('assets/images/logo_onboarding_2.png'),
              backgroundColor: ColorsTheme.white,
            ),
            backgroundColor: ColorsTheme.lightYellow,
          ),
        ),
        SizedBox(width: 14.w),
        Text("Kampoeng Timbel", style: contentStyle1(false)),
      ],
    );

    Widget contenTitle() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Nasi Timbel",style: productNameTextStyle),
        SizedBox(height: 14.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "Periode : ",style: periodValueTextStyle(true)),
              TextSpan(text: "28 November 2021 - 01 Desember 2021", style: periodValueTextStyle(false)),
            ]
          ),
        ),
      ],
    );

    Widget titleDescription() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowShop(),
          SizedBox(height: 17.h),
          Divider(height: 1.h, color: ColorsTheme.primary!.withOpacity(0.14)),
          SizedBox(height: 26.h),
          contenTitle(),
        ],
      )
    );

    Widget contentDescription() => Padding(
      padding: EdgeInsets.only(top: 16.h,bottom: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 19.w,bottom: 10.h),
            child: Text("Description",style: contentStyle1(true)),
          ),
          Container(height: 3.h, color: ColorsTheme.lightYellow),
          Padding(
            padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 18.w),
            child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nibh fusce arcu, nunc dictum nisi, eu. Vulputate et fermentum pulvinar platea adipiscing id. Enim feugiat eget a aliquet orci adipiscing eu. Blandit pellentesque adipiscing id massa condimentum. Enim sed consectetur odio imperdiet platea turpis diam, eu, in.",
            style: contentDescriptionTextStyle,
            ),
          ),
        ],
      ),
    );

    Widget headerImage() => SizedBox(
      width: 358.w,
      height: 271.h,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset('assets/images/detail_image.png'),
      )
    );

    Widget contentBody() => Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.h,vertical: 0.w),
          child: Column(
            children: [
              headerImage(),
              titleDescription(),
              Container(height: 9.h, color: ColorsTheme.lightGrey2),
              contentDescription(),
            ],
          ),
        ),
      ),
    );

    Widget body() => Container(
      child: Column(
        children: [
          appbar(),
          contentBody(),
        ],
      ),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: body(),
        )
      ), 
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }

}