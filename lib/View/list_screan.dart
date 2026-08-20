import 'package:animations/View/constants.dart';
import 'package:animations/View/single_screan.dart';
import 'package:flutter/material.dart';
import '../Model/models.dart';

class ListScrean extends StatelessWidget {
  const ListScrean({super.key, required this.keyId, required this.title});
  final int keyId;
  final String title;

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery.of(context).size;
    var bodyMargin = appSize.width / 10;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(keyId, context, texttheme, title),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: ListView.builder(
          itemCount: implicitAnimationTitleName.length,
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
                        keyId: index,
                        title: implicitAnimationTitleName[index]!,
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
                      implicitAnimationTitleName[index]!,
                      style: texttheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
