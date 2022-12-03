import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/image_select.dart';
import 'package:untitled/main.dart';

class HomeScreen extends StatefulWidget {
  List<CameraDescription>? cameras;
  HomeScreen({Key? key, required this.title, this.cameras}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Positioned(
                bottom: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 330,
                    height: 58,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(36)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        Text(
                          'هيا نتعلم',
                          style: TextStyle(fontSize: 21, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        )),
      );
    } else
      return Container();
  }
}
