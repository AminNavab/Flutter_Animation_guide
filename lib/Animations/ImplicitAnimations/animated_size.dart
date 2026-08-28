import 'package:flutter/material.dart';

class Animatedsize extends StatelessWidget {
  const Animatedsize({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 150,
        color: Colors.pink,
        child: AnimatedSize(
          duration: Duration(seconds: 2),
          reverseDuration: Duration(seconds: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Container(height: 150, width: 100, color: Colors.blueGrey),
              SizedBox(height: 100),
              if (isAnimating)
                Container(height: 150, width: 100, color: Colors.blueGrey),
            ],
          ),
        ),
      ),
    );
  }
}
