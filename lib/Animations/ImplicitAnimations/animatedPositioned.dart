import 'package:flutter/material.dart';

class Animatedpositioned extends StatelessWidget {
  const Animatedpositioned({super.key, required this.status});
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          bottom: status ? 150 : 550,
          left: status ? 100 : 300,

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
