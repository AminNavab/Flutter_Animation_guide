import 'package:flutter/material.dart';

class Animationtween extends StatefulWidget {
  const Animationtween({super.key});

  @override
  State<Animationtween> createState() => _AnimationtweenState();
}

class _AnimationtweenState extends State<Animationtween>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late final Animation<double> _doubleTween = Tween<double>(
    begin: 100,
    end: 200,
  ).animate(_animationController);
  late final Animation<Color?> _colorTween = ColorTween(
    begin: Colors.yellow,
    end: Colors.red,
  ).animate(_animationController);
  late final Animation<Alignment> _alignTween = AlignmentTween(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ).animate(_animationController);
  late final Animation<Size?> _sizeTween = SizeTween(
    begin: Size(100, 100),
    end: Size(200, 200),
  ).animate(_animationController);
  late final Animation<EdgeInsets?> _edgeInsetsTween = EdgeInsetsTween(
    begin: EdgeInsets.all(14),
    end: EdgeInsets.all(30),
  ).animate(_animationController);

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
