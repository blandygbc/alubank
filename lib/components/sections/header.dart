import 'package:alubank/data/bank_http.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final Future<String> api;

  const Header({super.key, required this.api});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ThemeColors.headerGradient,
            )),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
            top: 80,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(text: '\$', children: [
                    TextSpan(
                      text:
                          BankInherited.of(context).values.available.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ])),
                  const Text(
                    'Available balance',
                  ),
                ],
              ),
              // const Icon(
              //   Icons.account_circle,
              //   size: 42,
              // ),
              FutureBuilder(
                  future: widget.api,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const CircularProgressIndicator();
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.active:
                        // TODO: Handle this case.
                        break;
                      case ConnectionState.done:
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                text: 'R\$',
                                children: <TextSpan>[
                                  TextSpan(
                                      text: snapshot.data.toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge)
                                ],
                              ),
                            ),
                            const Text('Dolar to Real'),
                          ],
                        );
                    }
                    return const Text('API error');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
