import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/memo_screen.dart';

class ImageScreen extends StatefulWidget {
  List<CameraDescription>? cameras;
  ImageScreen({Key? key, required this.title, this.cameras}) : super(key: key);

  final String title;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late CameraController controller;
  late List<CameraDescription> _cameras = widget.cameras!;

  @override
  void initState() {
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
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  startCamera() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.high);
    await controller.initialize().then((value) {
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
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    if (controller.value.isInitialized) {
      return Scaffold(
          body: Stack(
        children: [
          Expanded(
              child: Center(
                  child: Transform.scale(
                      alignment: Alignment.center,
                      scale:
              controller.value.aspectRatio / deviceRatio, // controller.value.aspectRatio / deviceRatio,
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
              bottom: 100.0,
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
                            image: AssetImage('assets/images/paf.png')),
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
          Positioned.fill(
              bottom: 10.0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MemoScreen(
                                      cameras: _cameras,
                                    )),
                          );
                        }),
                        child: Image(
                            height: 54,
                            width: 54,
                            image: AssetImage('assets/images/magic.png')),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ));
    } else
      return Container();
  }
}
