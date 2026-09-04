import 'package:flutter/material.dart';

class AnimatedcrossFade extends StatelessWidget {
  const AnimatedcrossFade({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedCrossFade(
          firstChild: Icon(Icons.help_rounded, size: 250, color: Colors.yellow),
          secondChild: Icon(
            Icons.flutter_dash,
            size: 250,
            color: Colors.purple,
          ),
          crossFadeState: isAnimating
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
