import 'package:animations/Model/models.dart';
import 'package:animations/View/constants.dart';
import 'package:flutter/material.dart';

class Singlescrean extends StatefulWidget {
  final int keyId;
  final String title;

  const Singlescrean({super.key, required this.keyId, required this.title});

  @override
  State<Singlescrean> createState() => _SinglescreanState();
}

class _SinglescreanState extends State<Singlescrean> {
  @override
  Widget build(BuildContext context) {
    bool status = true;
    var appSize = MediaQuery.of(context).size;
    var bodyMargin = appSize.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(widget.keyId, context, texttheme, widget.title),
      body: Center(child: Text(widget.keyId.toString())),
      bottomNavigationBar: bottomNav(bodyMargin, status, texttheme),
    );
  }

  Padding bottomNav(double bodyMargin, bool status, TextTheme texttheme) {
    return Padding(
      padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin, bottom: 30),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (status) {
              status = false;
            } else {
              status = true;
            }
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
