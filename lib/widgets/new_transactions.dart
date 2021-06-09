import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTransaction;

  NewTransactions(this.addNewTransaction);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final textController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmitTransacton() {
    final title = textController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addNewTransaction(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: textController,
              onSubmitted: (_) => onSubmitTransacton(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => onSubmitTransacton(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: onSubmitTransacton,
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
