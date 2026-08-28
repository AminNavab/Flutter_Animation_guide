import 'package:animations/constan/data.dart';
import 'package:animations/View/constants.dart';
import 'package:flutter/material.dart';

class Singlescreen extends StatefulWidget {
  final int keyId;
  final String title;

  const Singlescreen({super.key, required this.keyId, required this.title});

  @override
  State<Singlescreen> createState() => _SinglescreenState();
}

class _SinglescreenState extends State<Singlescreen> {
  bool isAnimating = true;
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    var bodyMargin = appSize.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(widget.keyId, context, texttheme, widget.title),
      body: implicitAnimation[widget.keyId]!(isAnimating),
      bottomNavigationBar: bottomNav(bodyMargin, texttheme),
    );
  }

  Padding bottomNav(double bodyMargin, TextTheme texttheme) {
    return Padding(
      padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin, bottom: 30),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isAnimating = !isAnimating;
          });
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: colors[widget.keyId],
          ),
          child: Center(child: Text("RUN", style: texttheme.bodyMedium)),
        ),
      ),
    );
  }
}
