import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/controller/account_controller.dart';
import 'package:fusia/controller/dashboard_controller.dart';
import 'package:fusia/controller/login_controller.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/widget/custom_appbar_account.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PreviewCamera extends StatefulWidget {
  PreviewCamera({this.imgPath});
  final XFile? imgPath;

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {
  bool _load = false;
  LoginController? userController;
  DashboardController? dashboardController;
  AccountController? accountController;
  initState() {
    super.initState();

    initConstructor();
    // initData();
  }

  initConstructor() {
    userController = Get.put(LoginController());
    dashboardController = Get.put(DashboardController());
    accountController = Get.put(AccountController());
  }

  initPhoto() async {
    await userController!.retrieveUserLocalData();

    setState(() {
      var token = LoginController.userToken.value;
      var customerId = LoginController.customerId.value;
      // print(customerId);

      PostPhoto(customerId);
    });
  }

  PostPhoto(customerId) async {
    var result =
        await accountController!.SendPhoto(customerId, widget.imgPath!.name);
    print(result['details']);
    setState(() {
      if (result['status'] == 200) {
        print("Success send photo");
        Navigator.pushReplacementNamed(context, '/editaccount');
      } else {
        print("Failed send photo");
      }
    });
  }

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
                    onPressed: () {
                      // print(getFileSizeString(
                      //     bytes: File(widget.imgPath!.path).lengthSync()));

                      // final bytes =
                      //     File(widget.imgPath!.path).readAsBytesSync();
                      // String base64Image = base64Encode(bytes);
                      // print("imgbytes : $base64Image");
                      // _takePhoto();
                      // print(widget.imgPath!.name);
                      if (File(widget.imgPath!.path).lengthSync() < 512000) {
                        initPhoto();
                      } else {
                        showAlertDialog(context);
                      }
                    },
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

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("Image size too large"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  int getFileSizeString({required int bytes, int decimals = 0}) {
    //   if (bytes <= 0) return "0 Bytes";
    //   const suffixes = [" Bytes", "KB", "MB", "GB", "TB"];
    //   var i = (log(bytes) / log(1024)).floor();
    //   return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
    return bytes;
  }

  void _takePhoto() async {
    if (widget.imgPath! != null && widget.imgPath!.path != null) {
      setState(() {
        _load = true;
      });
      GallerySaver.saveImage(widget.imgPath!.path, albumName: 'FusiaAlbum')
          .then((bool? success) {
        Navigator.pushNamed(context, '/editaccount');
      });
    }
    ;
  }
}
