import 'package:flutter/material.dart';

import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'trx1',
      title: 'New Shoes',
      amount: 55.34,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'trx2',
      title: 'Groceress',
      amount: 25.34,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTrx = Transaction(
        id: 'trx${_transactions.length + 1}',
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTrx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(_addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
