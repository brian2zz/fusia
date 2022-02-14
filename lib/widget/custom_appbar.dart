import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';

class CustomAppBar extends StatefulWidget {
  var title;
  var isAccessDetail;

  CustomAppBar({Key? key, @required this.title, @required this.isAccessDetail}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Widget appbar() => Container(
          padding: EdgeInsets.only(left: 25.w, top: 26.h, bottom: 28.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => (widget.isAccessDetail) ? Navigator.pop(context) : Navigator.restorablePopAndPushNamed(context, '/navigation'),
                child: Image.asset('assets/icons/ic_arrow_back.png'),
              ),
              SizedBox(width: 21.w),
              Text(
                widget.title,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: ColorsTheme.neutralDark),
              ),
            ],
          ),
        );

    return appbar();
  }
}
