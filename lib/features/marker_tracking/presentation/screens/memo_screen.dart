import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:untitled/constants/colors.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/image_select.dart';
import 'package:untitled/main.dart';

class MemoScreen extends StatefulWidget {
  List<CameraDescription>? cameras;
  MemoScreen({Key? key, this.cameras}) : super(key: key);

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  late CameraController controller;
  late List<CameraDescription> _cameras = widget.cameras!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = CameraController(_cameras[0], ResolutionPreset.high);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    if (controller.value.isInitialized) {
      return GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageScreen(
                      title: '',
                      cameras: _cameras,
                    )),
          );
        }),
        child: Scaffold(
            body: Stack(
          children: [
            Expanded(
                child: Center(
                    child: Transform.scale(
                        alignment: Alignment.center,
                        scale:
                            1.2, // controller.value.aspectRatio / deviceRatio,
                        child: CameraPreview(controller)))),
            Positioned(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      height: 54,
                      width: 54,
                      image: AssetImage('assets/images/profile.png')),
                  Image(
                      height: 38,
                      width: 38,
                      image: AssetImage('assets/images/logo.png')),
                  Image(
                      height: 28,
                      width: 28,
                      image: AssetImage('assets/images/menu.png')),
                ],
              ),
            )),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, primaryColor],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 140,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    // If the widget is visible, animate to 0.0 (invisible).
                    // If the widget is hidden, animate to 1.0 (fully visible).
                    opacity: _visible ? 1.0 : 0.0,
                    curve: Curves.linear,
                    duration: const Duration(seconds: 02),
                    child: Image(
                        height: 300,
                        width: 150,
                        image: AssetImage("assets/images/memo_water.png")),
                  )),
            ),
            Positioned.fill(
                bottom: 35.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(
                              height: 54,
                              width: 54,
                              image: AssetImage('assets/images/yes.png')),
                        ),
                        Container(
                          width: 120,
                          height: 54,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(26),
                                  bottomLeft: Radius.circular(26),
                                  bottomRight: Radius.circular(26))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("قرعة ماء"),
                            ],
                          ),
                        ),
                        Image(
                            height: 64,
                            width: 64,
                            image: AssetImage('assets/images/face.png')),
                      ],
                    ),
                  ),
                )),
          ],
        )),
      );
    } else
      return Container();
  }
}
