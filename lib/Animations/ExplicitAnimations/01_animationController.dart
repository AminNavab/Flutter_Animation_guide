import 'package:flutter/material.dart';

class Animationcontroller extends StatefulWidget {
  const Animationcontroller({super.key});

  @override
  State<Animationcontroller> createState() => _AnimationcontrollerState();
}

class _AnimationcontrollerState extends State<Animationcontroller>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.animationBehavior;
  }

  void controllerAction(int index) {
    switch (index) {
      case 0:
        _animationController.forward();
        break;
      case 1:
        _animationController.reverse();
        break;
      case 2:
        _animationController.reset();
        break;
      case 3:
        _animationController.stop();
        break;
      case 4:
        _animationController.repeat();
        break;
      case 5:
        _animationController.animateTo(0.8);
        break;
      case 6:
        _animationController.animateBack(0.3);
        break;
    }
  }

  bool status = true;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
