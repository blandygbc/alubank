import 'package:alubank/components/color_dot.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class AccountStatus extends StatefulWidget {
  const AccountStatus({Key? key}) : super(key: key);

  @override
  State<AccountStatus> createState() => _AccountStatusState();
}

class _AccountStatusState extends State<AccountStatus> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ColorDot(color: DotColors.spent.color),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Spent'),
                      Text(
                        '\$${BankInherited.of(context).values.spent}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  ColorDot(color: DotColors.income.color),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Earned'),
                      Text(
                        '\$${BankInherited.of(context).values.earned}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: Text('Spending Limit: \$1000.00'),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: LinearProgressIndicator(
              value: BankInherited.of(context).values.spent / 1000,
              semanticsLabel: 'Current points',
              minHeight: 8,
            ),
          ),
          const ContentDivision(),
          Text(
              'This month you spent ${spentAndEarned().toStringAsFixed(2)} % of your money. Try to make it lower!'),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Tell me more!',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  double spentAndEarned() {
    double result = (BankInherited.of(context).values.spent /
            BankInherited.of(context).values.earned) *
        100;
    if (result.isNaN) {
      return 0;
    }
    return result;
  }
}
