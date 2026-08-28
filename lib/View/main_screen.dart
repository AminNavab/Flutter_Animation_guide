import 'package:animations/constan/data.dart';
import 'package:animations/View/list_screen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;
    var bodyMargin = Size.width / 8;
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: Size.height / 2,
          child: ListView.builder(
            itemCount: animationstype.length,
            itemBuilder: (context, index) {
              return Padding(
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
                      MaterialPageRoute(
                        builder: (context) => ListScreen(
                          keyId: index,
                          title: animationstype[index]!,
                        ),
                      ),
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
                      child: Text(
                        animationstype[index]!,
                        style: texttheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
