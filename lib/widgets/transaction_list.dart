import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final deleteTxn;

  TransactionList(this.userTransactions, this.deleteTxn);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: this.userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transaction added yet'),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Text(
                                '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  userTransactions[index].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat('dd MMM yyyy')
                                      .format(userTransactions[index].date),
                                  style: TextStyle(
                                      fontFamily: 'Caveat',
                                      fontSize: 14,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteTxn(userTransactions[index].id);
                          }),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
