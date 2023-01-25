import 'package:alubank/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AluBank());
}

class AluBank extends StatelessWidget {
  const AluBank({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AluBank',
      home: HomeScreen(),
    );
  }
}
