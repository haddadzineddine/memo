import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:untitled/constants/colors.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/home_screen.dart';

final SplachScreen = (cameras) => AnimatedSplashScreen(
      duration: 3000,
      splash: Image.asset("assets/images/logo.png"),
      nextScreen: HomeScreen(
        cameras: cameras,
      ),
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: primaryColor,
    );
