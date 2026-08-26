import 'package:flutter/material.dart';

class Animatedpadding extends StatelessWidget {
  const Animatedpadding({super.key, required this.status});
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AnimatedPadding(
            padding: status ? EdgeInsets.all(50) : EdgeInsets.all(100),
            duration: Duration(seconds: 2),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
