import 'package:flutter/material.dart';

AppBar appBar(String title, BuildContext context, TextTheme texttheme) {
  return AppBar(
    automaticallyImplyLeading: false,

    actions: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
    ],
    title: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(title, style: texttheme.titleLarge),
    ),
  );
}

class BottomNav extends StatelessWidget {
  const BottomNav({
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
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.lightGreen,
          ),
          child: Center(child: Text("RUN", style: texttheme.bodyMedium)),
        ),
      ),
    );
  }
}
