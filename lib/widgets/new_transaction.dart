import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTxn;
  final titleInput = new TextEditingController();
  final amountInput = new TextEditingController();

  NewTransaction(this.newTxn);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInput,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInput,
            ),
            FlatButton(
              onPressed: () => newTxn(titleInput.text, double.parse(amountInput.text)),
              textColor: Colors.purple,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
