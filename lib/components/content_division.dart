import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class ContentDivision extends StatelessWidget {
  const ContentDivision({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Divider(
        height: 2,
        color: ThemeColors.division,
      ),
    );
  }
}
