import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  final Function newTxn;
  final titleInput = new TextEditingController();
  final amountInput = new TextEditingController();

  NewTransaction(this.newTxn);

  void submitTxn() {
    final text = titleInput.text;
    final amount = double.parse(amountInput.text);

    if (text.isEmpty || amount < 0) {
      return;
    }
    newTxn(text, amount);
  }

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
               onSubmitted: (_) => this.submitTxn(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => this.submitTxn(),
            ),
            FlatButton(
              onPressed: submitTxn,
              textColor: Colors.purple,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
