# 🔵 Explicit Animations in Flutter

Explicit Animations give you direct control over the animation lifecycle.

Unlike Implicit Animations, Flutter does not automatically decide when and how the animation should run.

You control the animation using tools such as:

- `AnimationController`
- `Animation<T>`
- `Tween`
- `Curve`
- `AnimatedBuilder`
- Transition widgets
- Physics simulations
- And more...

The goal of this section is to understand **how Flutter's animation system works internally**, rather than simply using pre-built animated widgets.

---

# 🧠 What are Explicit Animations?

In an Implicit Animation, you usually change a property:

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: 300,
)
```

Flutter handles the animation automatically.

With an Explicit Animation, you control the animation yourself:

```dart
_animationController.forward();
```

You decide:

- When the animation starts
- When it reverses
- When it repeats
- When it stops
- How long it takes
- How its values are calculated
- How those values affect your widgets

The basic idea is:

```text
You control the animation
          │
          ▼
AnimationController
          │
          ▼
Animation<T>
          │
          ▼
Widget
```

---

# ⚙️ How Explicit Animations Work

An Explicit Animation usually consists of several parts.

```text
AnimationController
        │
        ▼
Animation<double>
        │
        ▼
Tween / Curve
        │
        ▼
AnimatedBuilder / Transition
        │
        ▼
Widget
```

Each part has a different responsibility.

### `AnimationController`

Controls the progress of the animation.

### `Animation<T>`

Provides animated values over time.

### `Tween<T>`

Defines the range between a beginning and an ending value.

### `Curve`

Controls how the animation progresses through time.

### `AnimatedBuilder`

Rebuilds the relevant part of the widget tree whenever the animation changes.

---

# 1. AnimationController

`AnimationController` is one of the most important classes in Flutter's animation system.

It generates values that normally progress from:

```text
0.0 → 1.0
```

Example:

```dart
late AnimationController _controller;

@override
void initState() {
  super.initState();

  _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );
}
```

The controller itself does not determine what the widget should look like.

It only controls the **progress** of the animation.

---

## `vsync`

`vsync` connects the animation to Flutter's rendering system.

A common approach is:

```dart
class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
```

Then:

```dart
AnimationController(
  vsync: this,
)
```

This allows Flutter to efficiently synchronize the animation with the screen's refresh cycle.

---

## `duration`

Defines how long it takes for the controller to go from:

```text
0.0 → 1.0
```

Example:

```dart
duration: const Duration(seconds: 2),
```

means:

```text
0.0
 │
 │ 2 seconds
 ▼
1.0
```

---

# 🎮 Controlling the Animation

The controller provides methods for controlling the animation.

## `forward()`

Runs the animation toward the upper bound.

```dart
_controller.forward();
```

Usually:

```text
0.0 → 1.0
```

---

## `reverse()`

Runs the animation backward.

```dart
_controller.reverse();
```

Usually:

```text
1.0 → 0.0
```

---

## `repeat()`

Repeats the animation.

```dart
_controller.repeat();
```

You can also configure the behavior:

```dart
_controller.repeat(
  reverse: true,
);
```

This creates:

```text
0 → 1 → 0 → 1 → 0 ...
```

---

## `stop()`

Stops the animation at its current position.

```dart
_controller.stop();
```

The current value is preserved.

---

## `reset()`

Resets the controller to its lower bound.

```dart
_controller.reset();
```

Usually:

```text
Current value → 0.0
```

---

## `animateTo()`

Moves the controller to a specific value.

```dart
_controller.animateTo(
  0.7,
  duration: const Duration(seconds: 1),
);
```

This allows you to animate to any point between the controller's bounds.

---

# 📊 AnimationController Value

The controller exposes its current progress through:

```dart
_controller.value
```

For example:

```dart
0.0
0.25
0.5
0.75
1.0
```

You can use this value directly:

```dart
final size = 100 + (_controller.value * 200);
```

This would produce:

```text
value = 0.0 → size = 100
value = 0.5 → size = 200
value = 1.0 → size = 300
```

This is the simplest possible form of an Explicit Animation.

---

# 2. Animation<T>

`Animation<T>` represents an animated value.

For example:

```dart
Animation<double>
Animation<Color?>
Animation<Alignment>
Animation<Size?>
```

An `Animation<T>` exposes a changing value through:

```dart
animation.value
```

Example:

```dart
final Animation<double> animation = ...
```

Then:

```dart
animation.value
```

might produce:

```text
100
120
145
180
220
260
300
```

depending on the animation.

---

# 🔗 AnimationController vs Animation<T>

These two are closely related but have different responsibilities.

```text
AnimationController
        │
        │ progress
        ▼
     0.0 → 1.0
        │
        ▼
   Animation<T>
        │
        │ transformed value
        ▼
     Widget
```

### AnimationController

Controls **time and progress**.

### Animation<T>

Represents the **animated value** that the widget uses.

---

# 3. Tween

A `Tween` defines a range between two values.

For example:

```dart
Tween<double>(
  begin: 100,
  end: 300,
)
```

means:

```text
100 → 300
```

The controller provides progress:

```text
0.0 → 1.0
```

The Tween converts that progress into a useful value:

```text
0.0 → 100
0.5 → 200
1.0 → 300
```

---

## Connecting Tween to AnimationController

```dart
late final Animation<double> _size = Tween<double>(
  begin: 100,
  end: 300,
).animate(_controller);
```

Now:

```dart
_size.value
```

represents the animated size.

---

# 🎨 Different Tween Types

Tweens are not limited to `double`.

Flutter provides many useful Tween classes.

### `Tween<double>`

```dart
Tween<double>(
  begin: 100,
  end: 300,
)
```

### `ColorTween`

```dart
ColorTween(
  begin: Colors.blue,
  end: Colors.red,
)
```

### `AlignmentTween`

```dart
AlignmentTween(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
)
```

### `SizeTween`

```dart
SizeTween(
  begin: const Size(100, 100),
  end: const Size(300, 300),
)
```

### `EdgeInsetsTween`

```dart
EdgeInsetsTween(
  begin: const EdgeInsets.all(10),
  end: const EdgeInsets.all(40),
)
```

The general idea is:

```text
Controller
    ↓
0.0 → 1.0
    ↓
Tween
    ↓
Begin → End
```

---

# 4. Curves

A curve changes the way the animation progresses.

Without a curve:

```text
0.0 → 1.0
```

The progress is linear.

With a curve:

```text
Time
 │
 │              ╭────
 │           ╭──╯
 │        ╭──╯
 │     ╭──╯
 │─────╯
 └────────────────────
        Progress
```

The animation can:

- Start slowly
- Accelerate
- Decelerate
- Bounce
- Overshoot
- Create elastic movement

---

## CurvedAnimation

A common way to apply a curve is:

```dart
final animation = CurvedAnimation(
  parent: _controller,
  curve: Curves.easeInOut,
);
```

Then use:

```dart
animation.value
```

as the animated progress.

---

# 🔗 Tween + Curve

You can combine them:

```dart
late final Animation<double> _size = Tween<double>(
  begin: 100,
  end: 300,
).animate(
  CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ),
);
```

Now the process is:

```text
AnimationController
        │
        ▼
     Progress
        │
        ▼
      Curve
        │
        ▼
      Tween
        │
        ▼
   Animated Value
```

---

# 5. AnimatedBuilder

`AnimatedBuilder` is one of the most important tools for building Explicit Animations.

It listens to an animation and rebuilds the widget whenever the animation changes.

Example:

```dart
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.scale(
      scale: _controller.value,
      child: child,
    );},
  child: const FlutterLogo(
    size: 100,
  ),
)
```

The important idea is:

```text
Animation changes
       ↓
AnimatedBuilder rebuilds
       ↓
Widget uses new value
```

---

# 🧩 Why use AnimatedBuilder?

You could technically listen to the controller manually:

```dart
_controller.addListener(() {
  setState(() {});
});
```

But this can cause the entire widget's `build()` method to run.

`AnimatedBuilder` allows you to rebuild only the part that depends on the animation.

This makes the code cleaner and can improve performance.

---



# 6. Transition Widgets

Flutter provides several transition widgets that work with Explicit Animations.

Instead of manually creating a `Transform` or opacity calculation, you can use specialized transition widgets.

Examples include:

- `FadeTransition`
- `ScaleTransition`
- `RotationTransition`
- `SlideTransition`
- `AlignTransition`
- `SizeTransition`
- `PositionedTransition`
- `DecoratedBoxTransition`
- `DefaultTextStyleTransition`
- `RelativePositionedTransition`

Example:

```dart
FadeTransition(
  opacity: _animation,
  child: const FlutterLogo(
    size: 100,
  ),
)
```

The transition widget receives an `Animation<T>` and uses its value to animate the child.

---

# 🆚 Transform vs Transition

These concepts are related but not identical.

### Transform

Changes the visual transformation of a widget.

```dart
Transform.rotate(...)
Transform.scale(...)
Transform.translate(...)
Transform(...)
```

It can be used with or without an animation.

### Transition

Connects an `Animation<T>` to a specific visual effect.

For example:

```dart
FadeTransition(
  opacity: _animation,
)
```

The transition itself does not create the animation.

The `Animation<T>` provides the changing value.

---

# 7. Transform

`Transform` allows you to apply transformations to a widget.

Common transformations include:

- Translation
- Rotation
- Scaling
- Skewing
- Matrix transformations

Examples:

```dart
Transform.translate(
  offset: const Offset(50, 0),
  child: child,
)
```

```dart
Transform.rotate(
  angle: pi,
  child: child,
)
```

```dart
Transform.scale(
  scale: 2,
  child: child,
)
```

These can be combined with Explicit Animations.

Example:

```dart
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.rotate(
      angle: _controller.value * pi,
      child: child,
    );
  },
  child: const FlutterLogo(),
)
```

---

# 8. Matrix4

For more advanced transformations, Flutter provides matrix transformations.

Example:

```dart
Transform(
  transform: Matrix4.identity()
    ..translateByDouble(
      _controller.value * 150,
      0,
      0,
      1,
  ),
  child: child,
)
```

A matrix can be used to create combinations of:

- Translation
- Rotation
- Scaling
- Skew
- 3D transformations

For example:

```text
AnimationController
        ↓
      value
        ↓
     Matrix4
        ↓
   Transformation
        ↓
      Widget
```

Matrix transformations become especially useful when simple `Transform` widgets are not enough.

---

# 9. Physics-Based Animations

Not every animation needs to follow a fixed duration.

Physics-based animations simulate real-world movement.

Examples include:

- Spring
- Friction
- Gravity
- Momentum
- Fling

Flutter provides classes such as:

SpringSimulation
FrictionSimulation
GravitySimulation

A physics-based animation can behave more naturally than a fixed-duration animation.

Instead of:

Start ─────────────► End
       1 second

you can have:

```text
Start
  │
  ├──► accelerate
  │
  │
  ├──► overshoot
  │
  ├──► bounce
  │
  └──► settle
```

Physics simulations are especially useful for interactive interfaces.

---

# 10. Staggered Animations

A staggered animation contains multiple animations that start or finish at different times.

For example:

```text
Animation
──────────────────────────────►

Opacity
████████

Scale
    ████████

Position
        ███████████

Color
              ████████
```

Instead of animating everything at once, each part gets its own interval.

A common approach is using `Interval`:

```dart
CurvedAnimation(
  parent: _controller,
  curve: const Interval(
    0.0,
    0.4,
  ),
)
```

Another animation might use:

```dart
const Interval(
  0.3,
  0.8,
)
```

This allows multiple animations to be controlled by a single controller.

---

# 11. Hero Animations

`Hero` animations create a transition between two routes.

Example:

```dart
Hero(
  tag: 'profile-image',
  child: Image.asset(
    'assets/profile.png',
  ),
)
```

The same `tag` is used on both screens.

Flutter then animates the widget between the routes.

```text
Screen A
   │
   │ Navigate
   ▼
Hero Animation
   │
   ▼
Screen B
```

Hero animations are useful for:

- Images
- Product cards
- Profile pictures
- Shared elements
- Page transitions

---

# 12. Animation Status

Animations also have a status.

You can listen to the controller:

```dart
_controller.addStatusListener((status) {
  print(status);
});
```

Possible statuses include:

```dart
AnimationStatus.dismissed
AnimationStatus.forward
AnimationStatus.reverse
AnimationStatus.completed
```

This is useful when you need to react to the animation lifecycle.

For example:

```dart
_controller.addStatusListener((status) {
  if (status == AnimationStatus.completed) {
    print('Animation completed');
  }
});
```

---

# 14. Animation Direction

Explicit Animations allow you to control direction.

For example:

```dart
_controller.forward();
```

runs forward.

```dart
_controller.reverse();
```

runs backward.

This makes it possible to create interactions such as:

```text
Closed
  │
  │ forward()
  ▼
Open
  │
  │ reverse()
  ▼
Closed
```

This is one of the major differences from simple Implicit Animations.

---

# 15. Multiple Animations with One Controller

One controller can drive multiple animations.

For example:

```dart
late final Animation<double> _size;
late final Animation<Color?> _color;
late final Animation<Alignment> _alignment;
```

All three can use the same controller:

```dart
_size = Tween<double>(
  begin: 100,
  end: 300,
).animate(_controller);

_color = ColorTween(
  begin: Colors.blue,
  end: Colors.red,
).animate(_controller);

_alignment = AlignmentTween(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
).animate(_controller);
```

Now one controller controls all of them:

```text
              AnimationController
                      │
          ┌───────────┼───────────┐
          ▼           ▼           ▼
         Size        Color      Alignment
```

This becomes extremely useful for coordinated animations.

---

# 16. Animation Intervals

`Interval` allows different animations to use different portions of the controller's timeline.

For example:

```dart
final firstAnimation = CurvedAnimation(
  parent: _controller,
  curve: const Interval(
    0.0,
    0.5,
  ),
);

final secondAnimation = CurvedAnimation(
  parent: _controller,
  curve: const Interval(
    0.5,
    1.0,
  ),
);
```

The result:

```text
0%                    100%
│──────────────────────│

First Animation
████████████

Second Animation
            ████████████
```

This is one of the foundations of staggered animations.

---

# 🧹 Lifecycle and Dispose

When using an `AnimationController`, you must dispose of it.

```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

This is important because the controller uses resources that should be released when the widget is removed.

A typical Explicit Animation widget therefore looks like:

```dart
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

---

# 🧩 A Complete Basic Example

Here is a minimal Explicit Animation using:

- `AnimationController`
- `Tween`
- `AnimatedBuilder`
- `Transform.scale`

```dart
import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation({super.key});

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _scale = Tween<double>(
      begin: 1,
      end: 2,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _scale,
          builder: (context, child) {
            return Transform.scale(
              scale: _scale.value,
              child: child,
            );
          },
          child: const FlutterLogo(
            size: 100,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
```

The important structure is:

```text
AnimationController
        ↓
Tween<double>
        ↓
Animation<double>
        ↓
AnimatedBuilder
        ↓
Transform.scale
        ↓
Widget
```

---

# 🆚 Implicit vs Explicit

The difference can be summarized as:

```text
IMPLICIT
──────────────

Change state
     ↓
Flutter handles animation
     ↓
New state
```

```text
EXPLICIT
──────────────

AnimationController
        ↓
Animation
        ↓
Tween / Curve
        ↓
Builder / Transition
        ↓
Widget
```

### Use Implicit Animations when:

- The animation is simple
- You only care about the beginning and ending states
- You don't need direct control
- You want concise code

### Use Explicit Animations when:

- You need precise control
- You need `forward()` / `reverse()`
- You need `repeat()`
- You need to pause or stop animations
- You need multiple coordinated animations
- You need staggered animations
- You need physics-based motion
- You need access to animation progress

---

# 🎯 A Practical Decision Guide

Ask yourself:

### Do I only need to animate a property when its value changes?

Use:

```text
Implicit Animation
```

### Do I need to control the animation manually?

Use:

```text
AnimationController
```

### Do I need to transform a value?

Use:

```text
Tween
```

### Do I want different timing behavior?

Use:

```text
Curve
```

### Do I need to rebuild widgets based on animation progress?

Use:

```text
AnimatedBuilder
```

### Do I need a predefined animated effect?

Consider:

```text
Transition Widgets
```

### Do I need natural physical movement?

Consider:

```text
Physics Simulation
```

### Do several animations need to happen at different times?

Consider:

```text
Intervals / Staggered Animations
```

---

# 🚀 Recommended Learning Order

A recommended learning path for Explicit Animations is:

```text
AnimationController
        ↓
Animation<T>
        ↓
Tween
        ↓
Curve
        ↓
CurvedAnimation
        ↓
AnimatedBuilder
        ↓
Transition Widgets
        ↓
Transform
        ↓
Matrix4
        ↓
Animation Status
        ↓
Intervals
        ↓
Staggered Animations
        ↓
Physics-based Animations
        ↓
Hero Animations
        ↓
Custom Animations
```

Start with the core animation system before moving into advanced techniques.

---

# 📌 Summary

Explicit Animations give you direct control over Flutter's animation system.

The core concept is:

```text
Controller
    ↓
Progress
    ↓
Animation
    ↓
Tween / Curve
    ↓
Builder / Transition
    ↓
Widget
```

The most important concepts to understand are:

- `AnimationController`
- `Animation<T>`
- `Tween`
- `Curve`
- `CurvedAnimation`
- `AnimatedBuilder`
- Transition widgets
- `Transform`
- `Matrix4`
- Animation status
- Intervals
- Staggered animations
- Physics simulations
- Hero animations

Once these concepts are understood, you can build much more complex animation systems instead of relying only on ready-made widgets.

---

## 🟢 Next Step

If you haven't already, start with the simpler approach first:

👉 [Explore Implicit Animations](../ImplicitAnimations/README.md)

Then return here and build your understanding of Explicit Animations step by step.