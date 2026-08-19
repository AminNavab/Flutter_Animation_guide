import 'package:animations/Model/models.dart';
import 'package:animations/View/list_screan.dart';
import 'package:flutter/material.dart';

class Mainscrean extends StatelessWidget {
  const Mainscrean({super.key});

  @override
  Widget build(BuildContext context) {
    var bodyMargin = MediaQuery.of(context).size.width / 8;
    var texttheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: bodyMargin,
              right: bodyMargin,
              top: 20,
              bottom: 20,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListScrean()),
                );
              },
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(animationstype[0], style: texttheme.bodyLarge),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: bodyMargin,
              right: bodyMargin,
              top: 20,
              bottom: 20,
            ),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Text(animationstype[1], style: texttheme.bodyLarge),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
