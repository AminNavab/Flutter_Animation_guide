import 'package:flutter/material.dart';

class Animatedpositioned extends StatelessWidget {
  const Animatedpositioned({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          bottom: isAnimating ? 150 : 550,
          left: isAnimating ? 100 : 300,

          duration: Duration(seconds: 2),
          curve: Curves.bounceInOut,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
