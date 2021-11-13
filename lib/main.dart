import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsly/view/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newsly',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}