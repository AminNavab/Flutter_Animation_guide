import 'package:flutter/material.dart';

class Animatedcontainer extends StatefulWidget {
  const Animatedcontainer({super.key});

  @override
  State<Animatedcontainer> createState() => _animatedContainer();
}

class _animatedContainer extends State<Animatedcontainer> {
  double h = 100;
  double w = 100;
  Color color = Colors.green;
  double border = 0;
  var state = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          height: h,
          width: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(border),
            color: color,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (state == 1) {
                h = 100;
                w = 100;
                color = Colors.green;
                border = 20;
                state = 0;
              } else {
                h = 240;
                w = 80;
                color = Colors.amber;
                border = 100;
                state = 1;
              }
            });
          },
          child: Text(
            "RUN | state:$state",
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
