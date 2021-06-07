import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function addNewTransaction;

  NewTransactions(this.addNewTransaction);

  final textController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: () {
                addNewTransaction(
                    textController.text, double.parse(amountController.text));
              },
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
