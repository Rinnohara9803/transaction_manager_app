import 'package:flutter/material.dart';
import 'package:transaction_app/widgets/chart.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({Key? key}) : super(key: key);

  final String label;
  final int spendingAmount;
  final double sAP;

  ChartBar(this.label, this.spendingAmount, this.sAP);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            '\$ $spendingAmount',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 70,
          width: 15,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: sAP,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
