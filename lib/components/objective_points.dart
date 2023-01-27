import 'package:alubank/components/color_dot.dart';
import 'package:flutter/material.dart';

class ObjectivePoints extends StatelessWidget {
  final Color color;
  final String text;
  const ObjectivePoints({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ColorDot(color: color),
          Text(text),
        ],
      ),
    );
  }
}
