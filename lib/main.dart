import 'package:alubank/data/bank_http.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:alubank/screens/home_screen.dart';
import 'package:alubank/themes/dark_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AluBank());
}

class AluBank extends StatelessWidget {
  const AluBank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AluBank',
      theme: AppTheme,
      home: BankInherited(
          child: HomeScreen(
        api: BankHttp().dolarToReal(),
      )),
    );
  }
}
