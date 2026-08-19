import 'package:animations/View/single_screan.dart';
import 'package:flutter/material.dart';
import '../Model/models.dart';

class ListScrean extends StatelessWidget {
  const ListScrean({super.key});

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    var bodyMargin = appSize.width / 10;
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Singlescrean(
                      title: implicitAnimationName[index]!,
                      keyId: index,
                    ),
                  ),
                );
              },
              child: Container(
                height: appSize.height / 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: Colors.lightBlueAccent,
                ),
                child: Center(
                  child: Text(
                    implicitAnimationName[index]!,
                    style: texttheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
