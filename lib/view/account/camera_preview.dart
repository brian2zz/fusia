import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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
        appBar: appBar(title: ''),
        body: Container(
          child: Image.file(
            File(widget.imgPath!.path),
            fit: BoxFit.contain,
          ),
        ));
  }
}
