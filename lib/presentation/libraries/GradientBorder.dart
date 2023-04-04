import 'package:flutter/material.dart';

class GradientBorder extends StatelessWidget {
  final Widget child;

  const GradientBorder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.deepOrangeAccent,
                Colors.pinkAccent,
                Colors.yellow,
              ])),
      child: Container(
        width: 220,
        height: 220,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
