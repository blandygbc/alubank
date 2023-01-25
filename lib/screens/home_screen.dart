import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/sections/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Header(),
          BoxCard(
            boxContent: Text('Hello wolrd!'),
          )
        ],
      ),
    );
  }
}
