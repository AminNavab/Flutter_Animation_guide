import 'package:flutter/material.dart';

class Animatedswitcher extends StatelessWidget {
  const Animatedswitcher({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 2),
          reverseDuration: Duration(seconds: 2),
          switchInCurve: Curves.bounceIn,
          switchOutCurve: Curves.bounceOut,
          // transitionBuilder: (child, animation) {},
          child: isAnimating
              ? Text(
                  "Animated Switcher",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Icon(Icons.flutter_dash, size: 350, color: Colors.blue),
        ),
      ),
    );
  }
}
