import 'package:flutter/material.dart';

class Animatedcontainer extends StatelessWidget {
  const Animatedcontainer({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        height: isAnimating ? 250 : 400,
        width: isAnimating ? 250 : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isAnimating ? 18 : 32),
          color: isAnimating ? Colors.green : Colors.amber,
        ),
      ),
    );
  }
}
