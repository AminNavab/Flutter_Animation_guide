import 'package:flutter/material.dart';

class TweenanimationBuilder extends StatelessWidget {
  const TweenanimationBuilder({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    double second = isAnimating == true ? 10 : 0;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("   TIMER   "),
            Text("0s to 10s", style: TextStyle(fontSize: 18)),
            SizedBox(height: 70),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: second),
              duration: Duration(seconds: second.toInt()),
              builder: (context, value, child) {
                return Container(
                  height: 100,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "${value.toStringAsFixed(0)} s",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
