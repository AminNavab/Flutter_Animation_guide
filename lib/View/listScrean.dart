import 'package:animations/Model/models.dart';
import 'package:flutter/material.dart';

class ListScrean extends StatelessWidget {
  const ListScrean({super.key});

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    var bodyMargin = Size.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ListView.builder(
        itemCount: implicitAnimationName.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: bodyMargin,
              right: bodyMargin,

              bottom: 20,
            ),
            child: Container(
              height: Size.height / 10,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.lightBlueAccent,
              ),
              child: Center(
                child: Text(
                  implicitAnimationName[index],
                  style: texttheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
