import 'package:flutter/material.dart';

class SliveranimatedOpacity extends StatelessWidget {
  const SliveranimatedOpacity({super.key, required this.isAnimating});
  final bool isAnimating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 250,
          child: CustomScrollView(
            slivers: [
              SliverAnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: isAnimating ? 1 : 0,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(8),
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Text("Item $index")),
                    );
                  }, childCount: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
