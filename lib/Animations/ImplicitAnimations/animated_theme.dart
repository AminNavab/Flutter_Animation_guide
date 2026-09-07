import 'package:flutter/material.dart';

class Animatedtheme extends StatelessWidget {
  const Animatedtheme({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: isAnimating ? ThemeData.dark() : ThemeData.light(),
      duration: Duration(seconds: 2),
      child: Scaffold(
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(Icons.flutter_dash, size: 150),
          ),
        ),
      ),
    );
  }
}
