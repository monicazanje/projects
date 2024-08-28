import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fashion_app/view/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class Splash extends StatefulWidget{
  const Splash({super.key});
  @override
  State<Splash>createState()=>_SplashState();
}
class _SplashState extends State<Splash>{
  @override
  Widget build(BuildContext context){
    return AnimatedSplashScreen(
      animationDuration: const Duration(seconds: 2),
      centered: true,
      splashIconSize: 300,
      // duration: 100,
      splash: LottieBuilder.asset("assets/Animation - 1724856661779.json",),
     nextScreen: const HomePage(),);
  }
}