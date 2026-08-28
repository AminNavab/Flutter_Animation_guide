import 'package:animations/constan/data.dart';
import 'package:animations/View/constants.dart';
import 'package:flutter/material.dart';

class Animationtween extends StatefulWidget {
  const Animationtween({super.key, required this.keyId, required this.title});
  final int keyId;
  final String title;

  @override
  State<Animationtween> createState() => _AnimationtweenState();
}

class _AnimationtweenState extends State<Animationtween>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int selectedTween = 0;

  late final Animation<double> _doubleTween = Tween<double>(
    begin: 100,
    end: 200,
  ).animate(_animationController);
  late final Animation<Color?> _colorTween = ColorTween(
    begin: Colors.yellow,
    end: Colors.red,
  ).animate(_animationController);
  late final Animation<Alignment> _alignTween = AlignmentTween(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ).animate(_animationController);
  late final Animation<Size?> _sizeTween = SizeTween(
    begin: Size(100, 100),
    end: Size(200, 200),
  ).animate(_animationController);
  late final Animation<EdgeInsets?> _edgeInsetsTween = EdgeInsetsTween(
    begin: EdgeInsets.all(14),
    end: EdgeInsets.all(30),
  ).animate(_animationController);

  @override
  void dispose() {
    // TODO: implement dispose

    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
  }

  void controllerAction(int index) {
    setState(() {
      selectedTween = index;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: appBar(widget.keyId, context, texttheme, widget.title),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    switch (selectedTween) {
                      case 0:
                        return Container(
                          height: _doubleTween.value,
                          width: _doubleTween.value,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                          ),
                        );
                      case 1:
                        return Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _colorTween.value,
                          ),
                        );
                      case 2:
                        return Align(
                          alignment: _alignTween.value,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pink,
                            ),
                          ),
                        );
                      case 3:
                        final size = _sizeTween.value;
                        return Container(
                          height: size?.height,
                          width: size?.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                          ),
                        );
                      case 4:
                        return Container(
                          padding: _edgeInsetsTween.value,

                          color: Colors.pink,
                          child: Text(
                            "Tweens",
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                        );
                      default:
                        return Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.blueGrey,
                          ),
                          child: Center(
                            child: Text(
                              "Tween is Hero",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: const Color.fromARGB(255, 134, 208, 243),
                ),
                child: Center(
                  child: Text(
                    "Animation<?> _controllerX = ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2,
                  ),
                  itemCount: tweenAction.length,

                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromARGB(255, 134, 208, 243),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controllerAction(index);
                        },
                        child: Center(
                          child: Text(
                            tweenAction[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
