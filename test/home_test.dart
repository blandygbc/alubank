import 'package:alubank/components/box_card.dart';
import 'package:alubank/data/bank_http.mocks.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:alubank/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  final MockBankHttp httpMock = MockBankHttp();
  testWidgets('Testing MockBankHttp dolarToReal', (testBot) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(
        child: HomeScreen(api: httpMock.dolarToReal()),
      ),
    ));
    verify(httpMock.dolarToReal()).called(1);
  });
  testWidgets('My widget has a text "Spent"', (testBot) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(
        child: HomeScreen(api: httpMock.dolarToReal()),
      ),
    ));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });
  testWidgets('finds a LinearProgressIndicator', (testBot) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(
        child: HomeScreen(api: httpMock.dolarToReal()),
      ),
    ));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
  testWidgets('finds a AccountStatus', (testBot) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(
        child: HomeScreen(api: httpMock.dolarToReal()),
      ),
    ));
    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });
  testWidgets('finds 5 BoxCards', (testBot) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(
        child: HomeScreen(api: httpMock.dolarToReal()),
      ),
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
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));
    await testBot.pumpWidget(MaterialApp(
      home: BankInherited(
        child: HomeScreen(api: httpMock.dolarToReal()),
      ),
    ));
    await testBot.tap(find.text('Deposit'));
    await testBot.tap(find.text('Earned'));
    await testBot.pumpAndSettle();
    expect(find.text('\$10.0'), findsOneWidget);
  });
}
