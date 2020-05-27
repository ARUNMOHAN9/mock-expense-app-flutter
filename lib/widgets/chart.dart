import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mock_expense_app_flutter/widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTxnValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double total = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          total += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': total,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return recentTransaction.fold(0.0, (sum, element) => sum += element.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTxnValues
              .map((e) => Flexible(
                fit: FlexFit.tight,
                    child: ChartBar(
                        e['day'],
                        e['amount'],
                        maxSpending == 0.0
                            ? 0.0
                            : (e['amount'] as double) / maxSpending),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
