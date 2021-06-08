import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addNewTransaction;

  NewTransactions(this.addNewTransaction);

  final textController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmitTransacton() {
    final title = textController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    addNewTransaction(title, amount);
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
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: onSubmitTransacton,
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
