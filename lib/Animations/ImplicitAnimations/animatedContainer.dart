import 'package:flutter/material.dart';

class Animatedcontainer extends StatelessWidget {
  const Animatedcontainer({super.key, required this.status});
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        height: status ? 250 : 400,
        width: status ? 250 : 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(status ? 18 : 32),
          color: status ? Colors.green : Colors.amber,
        ),
      ),
    );
  }
}
