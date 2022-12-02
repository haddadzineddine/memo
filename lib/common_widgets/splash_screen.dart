import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:untitled/features/marker_tracking/presentation/screens/home_screen.dart';

// ignore: non_constant_identifier_names
final SplachScreen = AnimatedSplashScreen(
  duration: 3000,
  splash: Image.asset("assets/logo.png"),
  nextScreen: const HomeScreen(
    title: 'home_screen',
  ),
  splashTransition: SplashTransition.rotationTransition,
  backgroundColor: Colors.black,
);
