import 'package:flutter/material.dart';

class CircleIndecatorPageview extends StatelessWidget {
  const CircleIndecatorPageview({super.key, required this.colorCircle});

  final Color colorCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 20),
      height: 20,
      width: 20,
      decoration: BoxDecoration(color: colorCircle, shape: BoxShape.circle),
    );
  }
}
