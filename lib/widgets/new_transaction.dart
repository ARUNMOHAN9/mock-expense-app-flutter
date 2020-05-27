import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTxn;

  NewTransaction(this.newTxn);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = new TextEditingController();

  final amountInput = new TextEditingController();

  var selectedDate = null;

  void submitTxn() {
    final text = titleInput.text;
    final amount = double.parse(amountInput.text);

    if (text.isEmpty || amount < 0 || selectedDate == null) {
      return;
    }
    widget.newTxn(text, amount, selectedDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((value)  {
      if (value == null) {
        return;
      }

      setState(() {
          selectedDate = value;
        });
    });
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
            Row(
              children: <Widget>[
                Text(selectedDate != null ? DateFormat('dd/MM/yyyy').format(this.selectedDate) : 'No date added'),
                FlatButton(
                  onPressed: () {
                    this._showDatePicker();
                  },
                  child: Text(this.selectedDate != null ? 'Update date' :'Add Date'),
                )
              ],
            ),
            RaisedButton(
              onPressed: submitTxn,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
