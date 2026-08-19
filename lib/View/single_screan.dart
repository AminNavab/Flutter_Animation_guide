import 'package:animations/View/constants.dart';
import 'package:flutter/material.dart';

class Singlescrean extends StatefulWidget {
  final String title;
  final int keyId;

  const Singlescrean({super.key, required this.title, required this.keyId});

  @override
  State<Singlescrean> createState() => _SinglescreanState();
}

class _SinglescreanState extends State<Singlescrean> {
  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    var bodyMargin = appSize.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(widget.title, context, texttheme),
      body: Center(child: Text("firs animation")),
      bottomNavigationBar: BottomNav(
        bodyMargin: bodyMargin,
        texttheme: texttheme,
      ),
    );
  }
}
