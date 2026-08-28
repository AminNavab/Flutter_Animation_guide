import 'package:flutter/material.dart';

class Animatedscale extends StatelessWidget {
  const Animatedscale({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: isAnimating ? 1 : 2,
        duration: Duration(seconds: 2),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
