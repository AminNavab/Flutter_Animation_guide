import 'package:flutter/material.dart';

class AnimateddefaultTextStyle extends StatelessWidget {
  const AnimateddefaultTextStyle({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: isAnimating ? 20 : 32,
            fontWeight: isAnimating ? FontWeight.bold : FontWeight.normal,
            color: isAnimating ? Colors.blue : Colors.black,
          ),
          duration: Duration(seconds: 2),
          child: Text("Animated Default Text Style"),
        ),
      ),
    );
  }
}
