import 'package:animations/Animations/ImplicitAnimations/animatedContainer.dart';
import 'package:animations/Model/models.dart';
import 'package:animations/View/constants.dart';
import 'package:animations/View/main_screan.dart';
import 'package:flutter/material.dart';

class Singlescrean extends StatefulWidget {
  final int keyId;
  final String title;

  const Singlescrean({super.key, required this.keyId, required this.title});

  @override
  State<Singlescrean> createState() => _SinglescreanState();
}

class _SinglescreanState extends State<Singlescrean> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    var bodyMargin = appSize.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(widget.keyId, context, texttheme, widget.title),
      body: implicitAnimationScrean[widget.keyId]!(status),
      bottomNavigationBar: bottomNav(bodyMargin, texttheme),
    );
  }

  Padding bottomNav(double bodyMargin, TextTheme texttheme) {
    return Padding(
      padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin, bottom: 30),
      child: GestureDetector(
        onTap: () {
          setState(() {
            status = !status;
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
