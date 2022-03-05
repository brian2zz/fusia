
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/server/arguments_pass/temp_pass_detail_outlet.dart';
import 'package:fusia/widget/custom_appbar.dart';
import 'package:fusia/widget/custom_toast.dart';

class DetailOutletPage extends StatefulWidget {
  
  @override
  _DetailOutletPageState createState() => _DetailOutletPageState();
}

class _DetailOutletPageState extends State<DetailOutletPage> {

  TextStyle outletStatusTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: ColorsTheme.primary,
  );

  TextStyle outletLabelTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorsTheme.white,
  );

  TextStyle generalLabelTextStyle(isTitle) => TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12.sp,
    fontWeight: (isTitle) ? FontWeight.w500 : FontWeight.w400,
    color: ColorsTheme.black,
  );

  @override
  Widget build(BuildContext context) {
    
    final detailOutlet = ModalRoute.of(context)!.settings.arguments as DetailOutletArgumentPass;

    Widget appbar() => CustomAppBar(title: "Outlets in Jakarta - ${detailOutlet.name}", isAccessDetail: true);

    Widget image() => SizedBox(
        height: 283.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/detail_image.png'),
            ),
          ],
        )
      );

    Widget outletStatus() => Container(
      width: 69.w,
      height: 24.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 3.h),
        child: Center(child: Text("OPEN",style: outletStatusTextStyle)),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: ColorsTheme.white,
      ),
    );

    Widget labelOutlet() => Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kampoeng Timbel",style: outletLabelTextStyle),
            Text("08:00 Pagi - 20:15 Malam",style: outletLabelTextStyle),
          ],
        ),
      ],
    );
    
    Widget descriptionOutlet() => Positioned(
      child: Container(
        height: 56.h,
        child: Padding(
          padding: EdgeInsets.only(left: 91.w,right: 20.w,top: 7.h,bottom: 9.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              labelOutlet(),
              outletStatus(),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsTheme.white!.withAlpha(80)),
          boxShadow: [
            BoxShadow(
              color: ColorsTheme.black!.withAlpha(100),
              blurRadius: 4.6.r,
              spreadRadius: 0.0.r,
            )
          ],
          color: ColorsTheme.black!.withOpacity(0.1)
        ),
      ),
      bottom: 0.h,
      left: 0.w,
      right: 0.w,
    );

    Widget logoOutlet() => Positioned(
      child: SizedBox(
        width: 52.w,
        height: 52.h,
        child:  CircleAvatar(
          backgroundColor: ColorsTheme.white!,
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.w, 16.h, 6.w, 14.h),
            child: SizedBox(
              width: 38.w,
              height: 22.h,
              child: Image.asset('assets/images/logo_onboarding_2.png'),
            ),
          ),
        ),
      ),
      left: 31.w,
      bottom: 14.h,
    );

    Widget btnAccessSubMenu(status) => InkWell(
      onTap: () {
        if(status == "menu") {
          showToast(context, "Fitur Menu masih dalam tahap pengembangan.");
        } else if(status == "maps") {
          showToast(context, "Fitur Maps masih dalam tahap pengembangan.");
        } else {
          showToast(context, "Fitur Telepon masih dalam tahap pengembangan.");
        }
      },
      child: Container(
        height: 88.h,
        child: Padding(
          padding: EdgeInsets.fromLTRB(41.w, 20.h, 41.w, 12.h),
          child: Column(
            children: [
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset((status == "menu") ? 'assets/icons/ic_menu_book.png' : (status == "maps") ? 'assets/icons/ic_maps.png' : 'assets/icons/ic_telephone.png'),
                ),
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(height: 12.h),
              Text((status == "menu") ? "Menu" : (status == "maps") ? "Maps" : "Telepon", style: generalLabelTextStyle(false)),
            ],
          ),
        ),
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: ColorsTheme.primary!.withOpacity(0.14),
              width: 0.5.w,
            ),
            horizontal: BorderSide(
              color: ColorsTheme.primary!.withOpacity(0.14),
              width: 1.w,
            )
          ),
        ),
      ),
    );

    Widget labelDescription(labelTitle,labelValue,status) => Row(
      children: [
        Text(labelTitle, style: generalLabelTextStyle(true)),
        SizedBox(width: (status == "location") ? 21.w : (status == "address") ? 33.w : 44.w),
        Text(" : ",style: generalLabelTextStyle(true)),
        SizedBox(width: 21.w),
        SizedBox(
          width: 180.w,
          child: Text(labelValue,style: generalLabelTextStyle(false),maxLines: 5),
        ),
      ],
    );

    Widget body() => Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: <Widget>[
            image(),
            descriptionOutlet(),
            logoOutlet(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            btnAccessSubMenu("menu"),
            btnAccessSubMenu("maps"),
            btnAccessSubMenu(""),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 27.h,left: 21.w,right: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              labelDescription("Located in", detailOutlet.name,"location"),
              SizedBox(height: 12.h),
              labelDescription("Address", "Jl. Sultan Iskandar Muda, RT.10/RW.6, Kby. Lama Utara, Kec. Kby. Lama, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12240","address"),
              SizedBox(height: 12.h),
              labelDescription("Phone", "021-12345678","phone"),
            ],
          ),
        )
      ],
    );
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: body(),
          appBar: PreferredSize(
            child: appbar(),
            preferredSize: Size.fromHeight(78.h),
          ),
        ),
      ), 
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}