import 'package:flutter/material.dart';

import '../models/transaction.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

class TransactionHome extends StatefulWidget {
  @override
  _TransactionHomeState createState() => _TransactionHomeState();
}

class _TransactionHomeState extends State<TransactionHome> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '121',
      amount: 66.66,
      title: 'New Shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: '135',
      amount: 55.66,
      title: 'New Shirt',
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    print('hit');
    final obj = new Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(obj);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
