import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar.dart';
import 'package:fusia/widget/product_widget.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  _PromoPageState createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
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
    Widget appbar() => CustomAppBar(title: "Promo",isAccessDetail: false);

    Widget itemPromoGridList() => Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(17.h, 20.h, 17.w, 5.h),
            child: GridView.builder(
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 295.h,
                crossAxisSpacing: 19.w,
                mainAxisSpacing: 30.h,
                childAspectRatio: 6.0.h / 8.0.h,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) => const CustomItemCard(
                imageItem: 'assets/images/dummy_product.png',
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet elit volutpat et massa",
                imageShopItem: 'assets/images/logo_onboarding_2.png',
              ),
            ),
          ),
        );

    Widget body() => Column(
          children: [
            appbar(),
            itemPromoGridList(),
          ],
        );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: body(),
          resizeToAvoidBottomInset: false,
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.primary),
    );
  }
}
