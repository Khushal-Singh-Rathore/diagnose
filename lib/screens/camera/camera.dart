import 'package:camera/camera.dart';
import 'package:converter/color/colors.dart';
import 'package:flutter/material.dart';

class CameraClass extends StatefulWidget {
  @override
  State<CameraClass> createState() => CameraClassState();
}

class CameraClassState extends State<CameraClass> {
  late List<CameraDescription> camreas;

  late CameraController cameraController;
  int direction = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startCamera(direction);
  }

  Future<void> startCamera(int direction) async {
    camreas = await availableCameras();
    cameraController =
        CameraController(camreas[direction], ResolutionPreset.high);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            CameraPreview(cameraController),
            GestureDetector(
                onTap: () {
                  setState(() {
                    direction = direction == 0 ? 1 : 0;
                    startCamera(direction);
                  });
                },
                child: CameraChange())
          ],
        ),
      );
    } catch (e) {
      return const SizedBox();
    }
  }

  Widget CameraChange() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: red,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.flip_camera_ios,
            color: Colors.white,
            size: 35,
          ),
        ));
  }
}
