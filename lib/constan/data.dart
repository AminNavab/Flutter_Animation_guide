import 'package:animations/Animations/ExplicitAnimations/01_animationController.dart';
import 'package:animations/Animations/ExplicitAnimations/02_animationTween.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedAlign.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedContainer.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedOpacity.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedPdding.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedPositioned.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedRotation.dart';
import 'package:animations/Animations/ImplicitAnimations/animatedScale.dart';
import 'package:flutter/material.dart';

Map<int, String> animationstype = {
  0: "Implicit Animations",
  1: "Explicit Animations",
};
final Map<int, Widget Function(bool)> implicitAnimation = {
  0: (status) => Animatedopacity(isAnimating: status),
  1: (status) => Animatedcontainer(isAnimating: status),
  2: (status) => Animatedpositioned(isAnimating: status),
  3: (status) => Animatedrotation(isAnimating: status),
  4: (status) => Animatedscale(isAnimating: status),
  5: (status) => Animatedalign(isAnimating: status),
  6: (status) => Animatedpadding(isAnimating: status),
  // 7: (status) => Animatedsize(status: status),
  // 8: (status) => AnimatedcrossFade(status: status),
  // 9: (status) => AnimateddefaultTextStyle(status: status),
  // 10: (status) => AnimatedphysicalModel(status: status),
  // 11: (status) => Animatedswitcher(status: status),
  // 12: (status) => AnimatedfractionallySizedBox(status: status),
  // 13: (status) => Animatedtheme(status: status),
  // 14: (status) => SliveranimatedOpacity(status: status),
  // 15: (status) => TweenanimationBuilder(status: status),
};

Map<int, String> implicitAnimationTitleName = {
  0: "AnimatedOpacity",
  1: "AnimatedContainer",
  2: "AnimatedPositioned",
  3: "AnimatedRotation",
  4: "AnimatedScale",
  5: "AnimatedAlign",
  6: "AnimatedPadding",
  7: "AnimatedSize",
  8: "AnimatedCrossFade",
  9: "AnimatedDefaultTextStyle",
  10: "AnimatedPhysicalModel",
  11: "AnimatedSwitcher",
  12: '''Animated
  FractionallySizedBox''',
  13: "AnimatedTheme",
  14: "SliverAnimatedOpacity",
  15: "TweenAnimationBuilder",
};
Map<int, String> explicitAnimationTitleName = {
  0: "Animation Controller",
  1: "Animation & Tween",
  // 2: "Transforms",
  // 3: "Interval",
};

final Map<int, Widget Function(int, String)> explicitAnimation = {
  0: (keyId, title) => Animationcontroller(keyId: keyId, title: title),
  1: (keyId, title) => Animationtween(keyId: keyId, title: title),
  // 2: "Transforms",
  // 3: "Interval",
};

Map<int, Color> colors = {
  0: Colors.blue,
  1: Colors.red,
  2: Colors.green,
  3: Colors.pink,
  4: Colors.purple,
  5: Colors.deepOrange,
  6: Colors.blueGrey,
  7: Colors.yellow,
  8: Colors.red,
  9: Colors.green,
  10: Colors.pink,
  11: Colors.purple,
  12: Colors.deepOrange,
  13: Colors.blueGrey,
  14: Colors.yellow,
  15: Colors.blue,
};
List controllerActions = [
  "forward()",
  "reverse()",
  "reset()",
  "stop()",
  "repeat()",
  "animateTo(0.8)",
  "animateBack(0.3)",
  "and .....",
  // "status",
  // "value = newValue",
  // "animatedWhit()",
  // "addStatusListener()",
];
List tweenAction = [
  "Tween<double>",
  "ColorTween",
  "AlignmentTween",
  "SizeTween",
  "EdgeInsetsTween",
  "and .....",
];
