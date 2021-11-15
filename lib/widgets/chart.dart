import 'package:flutter/material.dart';
import 'package:transaction_app/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/widgets/chart_bars.dart';

class Chart extends StatelessWidget {
  // const Chart({Key? key}) : super(key: key);

  final List<Transactiona> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        int totalAmount = 0;

        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.year == weekDay.year &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.day == weekDay.day) {
            totalAmount += recentTransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 3),
          'amount': totalAmount,
        };
      },
    );
  }

  double get totalWeekAmount {
    return groupedTransactionValues.fold(0,
        (previousValue, dailyTransactionAmount) {
      return previousValue +
          int.parse(
            dailyTransactionAmount['amount'].toString(),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((transactionValue) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                transactionValue['day'].toString(),
                int.parse(
                  transactionValue['amount'].toString(),
                ),
                totalWeekAmount == 0
                    ? 0.0
                    : double.parse(transactionValue['amount'].toString()) /
                        totalWeekAmount,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
