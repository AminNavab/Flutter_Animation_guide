import 'package:animations/Model/models.dart';
import 'package:flutter/material.dart';

class Animationcontroller extends StatefulWidget {
  const Animationcontroller({super.key});

  @override
  State<Animationcontroller> createState() => _AnimationcontrollerState();
}

class _AnimationcontrollerState extends State<Animationcontroller>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.animationBehavior;
  }

  void controllerAction(int index) {
    switch (index) {
      case 0:
        _animationController.forward();
        break;
      case 1:
        _animationController.reverse();
        break;
      case 2:
        _animationController.reset();
        break;
      case 3:
        _animationController.stop();
        break;
      case 4:
        _animationController.repeat();
        break;
      case 5:
        _animationController.animateTo(0.8);
        break;
      case 6:
        _animationController.animateBack(0.3);
        break;
    }
  }

  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final size = 100 + (_animationController.value * 120);
                    return Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    );
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
                    "Controller. ?",
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
                  itemCount: controllerActions.length,

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
                            controllerActions[index],
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
