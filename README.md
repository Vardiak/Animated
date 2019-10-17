# Animated

Animated is a very simple (yet powerful) implicit animation library made for Flutter.

Its goal is to be able to create a smooth animation between two values when an AnimatedContainer is not enough.

```dart
@override
Widget build(BuildContext context) {
  return Animated(
    value: 1.2,
    curve: Curves.easeInOut,
    duration: Duration(milliseconds: 300),
    builder: (context, child, animation) => Transform.scale(
      scale: animation.value,
      child: child,
    ),
    child: Container(
      width: 40,
      height: 40,
      color: Colors.red,
    ),
  );
}
```

In this example, whenever the value changes, the builder function will be called at each frame, from the old value to the new one.

Any widget that is not modified by the animation should be moved to the child property for optimization.
