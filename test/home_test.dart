import 'package:alubank/components/box_card.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:alubank/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My widget has a text "Spent"', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: const HomeScreen()),
    ));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });
  testWidgets('finds a LinearProgressIndicator', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: const HomeScreen()),
    ));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
  testWidgets('finds a AccountStatus', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: const HomeScreen()),
    ));
    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });
  testWidgets('finds 5 BoxCards', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(child: const HomeScreen()),
    ));
    expect(find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    }), findsNWidgets(5));
  });
  testWidgets('When tap deposit should update Earned value by 10',
      (testBot) async {
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(child: const HomeScreen()),
    ));
    await testBot.tap(find.text('Deposit'));
    await testBot.tap(find.text('Earned'));
    await testBot.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });
}
