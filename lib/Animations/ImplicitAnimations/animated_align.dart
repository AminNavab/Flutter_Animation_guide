import 'package:flutter/material.dart';

class Animatedalign extends StatelessWidget {
  const Animatedalign({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 500,
        width: 300,
        child: AnimatedAlign(
          alignment: isAnimating ? Alignment.bottomRight : Alignment.topLeft,
          duration: Duration(seconds: 2),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
