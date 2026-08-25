import 'package:animations/Animations/ExplicitAnimations/01_animationController.dart';
import 'package:animations/Animations/ExplicitAnimations/02_animationTween.dart';
import 'package:animations/View/main_screan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ),
      home: Mainscrean(),
    );
  }
}
