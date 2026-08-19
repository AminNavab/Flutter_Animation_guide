import 'package:flutter/material.dart';

class bottomNav extends StatelessWidget {
  const bottomNav({
    super.key,
    required this.bodyMargin,
    required this.texttheme,
  });

  final double bodyMargin;
  final TextTheme texttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin, bottom: 30),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.lightGreen,
        ),
        child: Center(child: Text("RUN", style: texttheme.bodyMedium)),
      ),
    );
  }
}
