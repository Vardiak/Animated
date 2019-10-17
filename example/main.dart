import 'package:animated/animated.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool scaled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            scaled = !scaled;
          });
        },
        child: Animated(
          value: scaled ? 1 : 0.5,
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
        ),
      ),
    );
  }
}
