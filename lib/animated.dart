library animated;

import 'package:flutter/material.dart';

class Animated extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final double value;
  final Widget child;
  final Widget Function(BuildContext context, Widget child, Animation animation)
      builder;

  Animated({
    Key key,
    @required this.value,
    @required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.child,
  }) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated>
    with SingleTickerProviderStateMixin {
  AnimationController animation;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      value: widget.value,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    );
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Animated oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      animation.animateTo(
        widget.value,
        duration: widget.duration,
        curve: widget.curve,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => widget.builder(
        context,
        widget.child,
        animation,
      ),
    );
  }
}
