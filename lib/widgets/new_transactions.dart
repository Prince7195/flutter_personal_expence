import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './adoptive_flat_button.dart';

class NewTransactions extends StatefulWidget {
  final Function addNewTransaction;

  NewTransactions(this.addNewTransaction);

  @override
  _NewTransactionsState createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitTransacton() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final title = _textController.text;
    final amount = double.parse(_amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }

      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _textController,
                onSubmitted: (_) => _submitTransacton(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                onSubmitted: (_) => _submitTransacton(),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Container(
                height: 75,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    AdoptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: _submitTransacton,
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    textStyle: TextStyle(
                      color: Theme.of(context).textTheme.button!.color,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
