import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToast extends StatefulWidget {
  final String message;

  const CustomToast({required this.message, Key? key}) : super(key: key);

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.defaultSize.width,
      height: 20.h,
      child: Text(widget.message),
    );
  }
}
