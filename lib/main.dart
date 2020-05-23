import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

import 'models/transaction.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  void _startAddNewTxn(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return NewTransaction(_addTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTxn(context),
          )
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Chart !!!'),
              elevation: 5,
            ),
          ),
         TransactionList(_userTransactions),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () => _startAddNewTxn(context),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
