import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
          gradient: SweepGradient(colors: [
        Colors.amber,
        Colors.pink,
        Colors.lightGreen,
        Colors.blueAccent,
        Colors.deepOrange,
        Colors.deepPurple,
        Colors.indigo,
        Colors.white
      ])),
    );
  }
}
