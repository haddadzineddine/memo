import 'package:flutter/material.dart';
import 'package:untitled/common_widgets/splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:untitled/constants/colors.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/home_screen.dart';

late List<CameraDescription> _cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  //final cameras =await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset("assets/images/logo.png"),
      nextScreen: HomeScreen(
        title: '',
        cameras: _cameras,
      ),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: primaryColor,
    ));
  }
}
