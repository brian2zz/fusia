import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';

class CustomItemCard extends StatefulWidget {
  final String imageItem;
  final String description;
  final String imageShopItem;

  const CustomItemCard(
      {Key? key,
      required this.imageItem,
      required this.description,
      required this.imageShopItem})
      : super(key: key);

  @override
  _CustomItemCardState createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  TextStyle itemProductTextStyle(isDetailButton) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: (isDetailButton) ? FontWeight.w500 : FontWeight.w400,
        fontSize: (isDetailButton) ? 10.sp : 9.sp,
        color: ColorsTheme.primary,
      );

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(widget.imageShopItem),
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

    Widget contentItemProduct() => SizedBox(
          height: 600.h,
          child: Column(
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
                    child: Image.asset(widget.imageItem),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8.w, 15.h, 21.w, 7.h),
                child: Text(
                  widget.description,
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
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                  child: Center(
                    child: Text("Details", style: itemProductTextStyle(true)),
                  ),
                ),
              ),
            ],
          ),
        );

    return Wrap(
      children: [
        Container(
          width: 158.w,
          height: 223.h,
          child: Stack(
            clipBehavior: Clip.none,
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
        ),
      ],
    );
  }
}
