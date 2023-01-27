import 'package:alubank/components/box_card.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:flutter/material.dart';

class AccountActions extends StatelessWidget {
  const AccountActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Account Actions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  BankInherited.of(context).values.deposit(10);
                },
                child: const BoxCard(
                    boxContent: _AccountActionsContent(
                  icon: Icon(Icons.account_balance_wallet),
                  text: 'Deposit',
                )),
              ),
              InkWell(
                onTap: () {
                  BankInherited.of(context).values.transfer(10);
                },
                child: const BoxCard(
                    boxContent: _AccountActionsContent(
                  icon: Icon(Icons.cached),
                  text: 'Transfer',
                )),
              ),
              InkWell(
                onTap: () {},
                child: const BoxCard(
                    boxContent: _AccountActionsContent(
                  icon: Icon(Icons.center_focus_strong),
                  text: 'Scan',
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _AccountActionsContent extends StatelessWidget {
  final Icon icon;
  final String text;
  const _AccountActionsContent({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: icon,
          ),
          Text(text),
        ],
      ),
    );
  }
}
