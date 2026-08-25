# 🟢 Implicit Animations in Flutter

Implicit Animations are one of the simplest ways to create animations in Flutter.

They allow you to animate changes between two states without manually managing an `AnimationController`.

Instead of telling Flutter:

> "Start the animation, update the value, calculate the progress, and rebuild the widget."

you simply change a property and Flutter automatically animates the transition.

---

## 🧠 What are Implicit Animations?

Imagine you have a container:

```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
)
```

and you want it to become:

```dart
Container(
  width: 300,
  height: 300,
  color: Colors.red,
)
```

With a normal `Container`, Flutter immediately changes from the first state to the second state.

With an implicit animation, Flutter automatically animates between them:

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: 300,
  height: 300,
  color: Colors.red,
)
```

Flutter handles the animation for you.

---

# ⚙️ How Implicit Animations Work

The basic idea is:

```text
Old Value
    │
    ▼
Animated Widget
    │
    │ duration + curve
    ▼
New Value
```

When the value of an animated property changes, Flutter:

1. Detects the new value
2. Compares it with the previous value
3. Creates an animation between them
4. Runs the animation
5. Rebuilds the widget during the animation

You only need to provide the new state.

---

# 🔑 Common Parameters

Most implicit animation widgets share some important parameters.

## `duration`

Controls how long the animation takes.

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: 300,
)
```

For example:

```text
300 ms  → Fast
1 sec   → Normal
2 sec   → Slow
```

---

## `curve`

Controls the timing and motion of the animation.

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  curve: Curves.easeInOut,
  width: 300,
)
```

Without a custom curve, the animation uses the widget's default curve.

Common examples:

```dart
Curves.linear
Curves.easeIn
Curves.easeOut
Curves.easeInOut
Curves.fastOutSlowIn
Curves.bounceOut
Curves.elasticOut
```

Curves allow you to control how the animation progresses over time.

---

## `onEnd`

Called when the animation finishes.

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: 300,
  onEnd: () {
    print('Animation finished');
  },
)
```

This can be useful when you want to trigger another action after an animation completes.

---

# 🎨 Main Implicit Animation Widgets

Flutter provides many ready-to-use implicit animation widgets.

Each widget is designed to animate a specific set of properties.

---

# 1. AnimatedContainer

`AnimatedContainer` is one of the most useful implicit animation widgets.

It can animate properties such as:

- Width
- Height
- Color
- Padding
- Alignment
- Border
- Border radius
- Decoration
- Constraints

Example:

```dart
AnimatedContainer(
  duration: const Duration(seconds: 1),
  width: isExpanded ? 300 : 100,
  height: isExpanded ? 300 : 100,
  decoration: BoxDecoration(
    color: isExpanded ? Colors.red : Colors.blue,
    borderRadius: BorderRadius.circular(
      isExpanded ? 30 : 10,
    ),
  ),
)
```

### Common use cases

- Expanding cards
- Changing colors
- Changing size
- Animated buttons
- Interactive containers
- Selecting UI elements

---

# 2. AnimatedOpacity

`AnimatedOpacity` animates the opacity of a widget.

```dart
AnimatedOpacity(
  duration: const Duration(milliseconds: 500),
  opacity: visible ? 1 : 0,
  child: const Text('Hello'),
)
```

Opacity values are between:

```text
0 → Invisible
1 → Fully visible
```

### Common use cases

- Fade in
- Fade out
- Showing and hiding content
- Loading states
- Overlay
elements

### Important

An opacity of `0` makes the widget invisible, but the widget can still participate in layout and hit testing.

If you want to completely remove a widget from the widget tree, use conditional rendering instead:

```dart
if (visible)
  const Text('Hello')
```

---

# 3. AnimatedAlign

`AnimatedAlign` animates changes to the alignment of its child.

```dart
AnimatedAlign(
  duration: const Duration(seconds: 1),
  alignment: Alignment.topRight,
  child: Container(
    width: 80,
    height: 80,
    color: Colors.blue,
  ),
)
```

For example:

```dart
alignment: isMoved
    ? Alignment.topRight
    : Alignment.bottomLeft,
```

### Common use cases

- Moving a widget between positions
- Aligning content dynamically
- Simple UI transitions
- Animated menus

---

# 4. AnimatedPositioned

`AnimatedPositioned` is designed to work inside a `Stack`.

It animates positional properties such as:

- `top`
- `right`
- `bottom`
- `left`
- `width`
- `height`

Example:

```dart
Stack(
  children: [
    AnimatedPositioned(
      duration: const Duration(seconds: 1),
      left: isMoved ? 200 : 0,
      top: 100,
      child: Container(
        width: 80,
        height: 80,
        color: Colors.blue,
      ),
    ),
  ],
)
```

### Common use cases

- Moving elements inside a `Stack`
- Animated overlays
- Floating elements
- Custom menus
- Game-like UI

---

# 5. AnimatedRotation

`AnimatedRotation` animates the rotation of a widget.

```dart
AnimatedRotation(
  duration: const Duration(seconds: 1),
  turns: isRotated ? 0.5 : 0,
  child: const Icon(
    Icons.refresh,
    size: 80,
  ),
)
```

The `turns` parameter represents complete rotations.

```text
 0    →    0°
0.25  →    90°
0.5   →    180°
0.75  →    270°
 1    →    360°
```

### Common use cases

- Rotating icons
- Menu buttons
- Expand/collapse indicators
- Refresh animations

---

# 6. AnimatedScale

`AnimatedScale` animates the scale of a widget.

```dart
AnimatedScale(
  duration: const Duration(milliseconds: 500),
  scale: isSelected ? 1.3 : 1,
  child: const FlutterLogo(
    size: 100,
  ),
)
```

For example:

```text
scale: 1
    ↓
Original size

scale: 2
    ↓
2× larger

scale: 0.5
    ↓
Half the size
```

### Common use cases

- Button press effects
- Selecting items
- Highlighting elements
- Zoom effects
- Interactive cards

---

# 7. AnimatedSlide

`AnimatedSlide` animates the position of a widget using an `Offset`.

```dart
AnimatedSlide(
  duration: const Duration(seconds: 1),
  offset: isMoved
      ? const Offset(1, 0)
      : Offset.zero,
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
  ),
)
```

The `Offset` is relative to the size of the widget.

```text
Offset.zero
    ↓
(0, 0)

Offset(1, 0)
    ↓
Move one widget-width to the right

Offset(-1, 0)
    ↓
Move one widget-width to the left

Offset(0, 1)
    ↓
Move one widget-height down

Offset(0, -1)
    ↓
Move one widget-height up
```

### Common use cases

- Slide-in effects
- Slide-out effects
- Notifications
- Panels
- Menus

---

# 8. AnimatedSize

`AnimatedSize` animates changes to the size of its child.

```dart
AnimatedSize(
  duration: const Duration(seconds: 1),
  child: Container(
    width: 200,
    height: expanded ? 300 : 100,
  ),
)
```

### Common use cases

- Expandable sections
- Dropdowns
- Dynamic content
- Collapsible widgets

The important idea is that the child's size changes, and `AnimatedSize` animates that size change.

---

# 9. AnimatedPadding

`AnimatedPadding` animates changes to padding.

```dart
AnimatedPadding(
  duration: const Duration(seconds: 1),
  padding: EdgeInsets.all(
    expanded ? 40 : 10,
  ),
  child: const Text('Hello'),
)
```

### Common use cases

- Expanding UI elements
- Spacing animations
- Interactive cards
- Layout transitions

---

# 10. AnimatedPhysicalModel

`AnimatedPhysicalModel` animates physical properties such as:

- Elevation
- Color
- Shadow color
- Border radius
- Shape

Example:

```dart
AnimatedPhysicalModel(
  duration: const Duration(seconds: 1),
  elevation: selected ? 20 : 2,
  color: Colors.white,
  sha
  dowColor: Colors.black,
  borderRadius: BorderRadius.circular(20),
  shape: BoxShape.rectangle,
  child: const SizedBox(
    width: 150,
    height: 150,
  ),
)
```

### Common use cases

- Cards
- Elevated surfaces
- Material-style UI
- Selection effects

---

# 11. AnimatedDefaultTextStyle

`AnimatedDefaultTextStyle` animates changes to a text style.

```dart
AnimatedDefaultTextStyle(
  duration: const Duration(seconds: 1),
  style: TextStyle(
    fontSize: selected ? 32 : 18,
    fontWeight: selected
        ? FontWeight.bold
        : FontWeight.normal,
    color: selected
        ? Colors.blue
        : Colors.black,
  ),
  child: const Text('Flutter'),
)
```

### Common use cases

- Text emphasis
- Selection states
- Titles
- Interactive text

---

