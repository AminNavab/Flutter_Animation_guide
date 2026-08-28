import 'package:flutter/material.dart';

class Animatedopacity extends StatelessWidget {
  const Animatedopacity({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: isAnimating ? 1 : 0,
        duration: Duration(seconds: 2),
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
