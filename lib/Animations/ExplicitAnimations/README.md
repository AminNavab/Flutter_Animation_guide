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
  ├──► overshoot
  │
  ├──► bounce
  │
  └──► settle


Physics simulations are especially useful for interactive interfaces.

---