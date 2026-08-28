import 'package:flutter/material.dart';

class Animatedrotation extends StatelessWidget {
  const Animatedrotation({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedRotation(
            turns: isAnimating ? 1.0 : 0.0,

            duration: Duration(seconds: 2),
            // alignment: Alignment.topCenter,
            curve: Curves.linear,
            child: Container(
              height: 240,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.grey, width: 2),
              ),
            ),
          ),
          SizedBox(height: 100),
          AnimatedRotation(
            turns: isAnimating ? 0.0 : 0.5,
            duration: Duration(seconds: 2),
            child: Icon(
              Icons.arrow_right_alt_rounded,
              color: Colors.amber,
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
