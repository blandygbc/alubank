import 'package:alubank/components/box_card.dart';
import 'package:alubank/components/content_division.dart';
import 'package:alubank/components/objective_points.dart';
import 'package:alubank/data/bank_inherited.dart';
import 'package:alubank/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class PointsCard extends StatefulWidget {
  const PointsCard({
    super.key,
  });

  @override
  State<PointsCard> createState() => _PointsCardState();
}

class _PointsCardState extends State<PointsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
      },
      child: BoxCard(
        boxContent: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text('Total points:'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                BankInherited.of(context).values.points.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const ContentDivision(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'Objetivos:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ObjectivePoints(
              color: DotColors.delivery.color,
              text: 'Free delivery: 15000pts',
            ),
            ObjectivePoints(
              color: DotColors.streaming.color,
              text: '1 month streaming: 30000pts',
            ),
          ],
        ),
      ),
    );
  }
}
