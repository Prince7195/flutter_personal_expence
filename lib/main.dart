import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.purpleAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return NewTransactions(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => _startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
    );
  }
}
