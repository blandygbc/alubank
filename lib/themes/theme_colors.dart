import 'package:flutter/material.dart';

enum DotColors {
  spent(color: Color.fromRGBO(255, 175, 29, 1)),
  income(color: Color.fromRGBO(191, 69, 198, 1)),
  delivery(color: Color.fromRGBO(250, 0, 112, 1)),
  streaming(color: Color.fromRGBO(75, 89, 191, 1));

  final Color color;
  const DotColors({required this.color});
}

class ThemeColors {
  static const MaterialColor primaryColor = Colors.purple;
  static const List<Color> headerGradient = <Color>[
    Color.fromRGBO(103, 99, 234, 1),
    Color.fromRGBO(155, 105, 254, 1),
    Color.fromRGBO(195, 107, 255, 1),
  ];
  static const division = Color.fromRGBO(166, 166, 166, 1);
}
