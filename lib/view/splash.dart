import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:newsly/view/beranda.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.lightBlue,
          child: Center(
            child: Text(
                    "Newsly",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
        nextScreen: Beranda(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.blue,
      ),
    );
  }
}


