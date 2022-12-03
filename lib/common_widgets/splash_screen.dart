import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:untitled/constants/colors.dart';
<<<<<<< HEAD
import 'package:untitled/features/marker_tracking/presentation/screens/home_screen.dart';
=======
import 'package:untitled/features/marker_tracking/presentation/screens/education_screen.dart';


final SplachScreen = AnimatedSplashScreen(
  duration: 3000,
  splash: Image.asset("assets/images/logo.png"),
  nextScreen: EducationScreen(),
  splashTransition: SplashTransition.rotationTransition,
  backgroundColor: primaryColor,
);
>>>>>>> 0570f222fdd7d2f64ea68e2202e8dbdd0794ccc1
