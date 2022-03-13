import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar_account.dart';

class PreviewCamera extends StatefulWidget {
  PreviewCamera({this.imgPath});
  final XFile? imgPath;

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: appBar(title: ''),
        body: Stack(
      children: [
        Image.file(
          File(widget.imgPath!.path),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 250.h,
            width: double.infinity,
            padding: EdgeInsets.all(20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_circle,
                      color: ColorsTheme.lightGreen,
                      size: 70.h,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: ColorsTheme.lightRed,
                      size: 70.h,
                    ),
                  ),
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
