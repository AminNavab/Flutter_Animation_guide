import 'package:flutter/material.dart';

class AnimatedfractionallySizedBox extends StatelessWidget {
  const AnimatedfractionallySizedBox({super.key, required this.isAnimating});
  final bool isAnimating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedFractionallySizedBox(
          duration: Duration(seconds: 2),
          widthFactor: isAnimating ? 0.4 : 0.8,
          heightFactor: isAnimating ? 0.4 : 0.8,
          child: Container(decoration: BoxDecoration(color: Colors.purple)),
        ),
      ),
    );
  }
}
