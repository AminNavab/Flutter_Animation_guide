import 'package:flutter/material.dart';

class AnimatedphysicalModel extends StatelessWidget {
  const AnimatedphysicalModel({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedPhysicalModel(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(isAnimating ? 12 : 36),
          elevation: isAnimating ? 12 : 24,

          color: Colors.grey,
          shadowColor: isAnimating ? Colors.red : Colors.amber,
          duration: Duration(seconds: 2),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Animated Physical Model"),
          ),
        ),
      ),
    );
  }
}
