import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusia/color/colors_theme.dart';
import 'package:fusia/view/account/camera_preview.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  List? cameras;
  int? selectedCamera;
  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if (cameras!.length > 0) {
        selectedCamera = 0;
        initCamera(cameras![selectedCamera!]).then((_) {});
      } else {
        print('camera not found');
      }
    }).catchError((e) {
      print(e.code);
    });
  }

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }
    cameraController =
        CameraController(cameraDescription, ResolutionPreset.max);
    cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (cameraController!.value.hasError) {
      return AlertDialog(
          content: Container(
        child: Text('camera error'),
      ));
    }
    try {
      await cameraController!.initialize();
    } catch (e) {
      return AlertDialog(
          content: Container(
        child: Text('camera error $e'),
      ));
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ratio = size.width / size.height;
    // print(ratio);
    return Scaffold(
        backgroundColor: ColorsTheme.black,
        body: Stack(
          children: [
            // Transform.scale(
            //   scale: cameraController!.value.aspectRatio / ratio,
            Align(
              alignment: Alignment.center,
              child: cameraPreview(),
            ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120.h,
                width: double.infinity,
                padding: EdgeInsets.all(20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CameraToggle(),
                    CameraControl(context),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget cameraPreview() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return Text('Loading', style: TextStyle(color: ColorsTheme.white));
    }
    return AspectRatio(
      aspectRatio: cameraController!.value.aspectRatio,
      child: CameraPreview(cameraController!),
    );
  }

  Widget CameraToggle() {
    if (cameras == null || cameras!.isEmpty) {
      return Spacer();
    }
    CameraDescription selectedCameras = cameras![selectedCamera!];
    CameraLensDirection switchLens = selectedCameras.lensDirection;
    return Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: () {
            switchCameraPress();
          },
          icon: Icon(
            getCameraLens(switchLens),
            color: ColorsTheme.white,
            size: 24.h,
          ),
        ),
      ),
    );
  }

  getCameraLens(switchLens) {
    switch (switchLens) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }

  switchCameraPress() {
    selectedCamera =
        selectedCamera! < cameras!.length - 1 ? selectedCamera! + 1 : 0;
    CameraDescription selectedCameras = cameras![selectedCamera!];
    initCamera(selectedCameras);
  }

  Widget CameraControl(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            FloatingActionButton(
              child: Icon(Icons.camera, color: ColorsTheme.white),
              backgroundColor: ColorsTheme.primary,
              onPressed: () {
                pressCapture(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  pressCapture(context) async {
    try {
      await cameraController!.takePicture().then((value) {
        print(value);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PreviewCamera(imgPath: value)));
      });
    } catch (e) {
      AlertDialog(
          content: Container(
        child: Text('$e'),
      ));
    }
  }
}
