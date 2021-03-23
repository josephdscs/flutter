import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function onAdd;

  NewTransaction(this.onAdd);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime _selectedDate;

  void _onSubmit() {
    if (_amountInputController.text.isEmpty) {
      return;
    }
    final newTitle = _titleInputController.text;
    final newAmount = double.parse(_amountInputController.text);
    final newDate = _selectedDate;

    if (newTitle.isEmpty || newAmount <= 0 || newDate == null) {
      return;
    }

    // widget and context are special properties
    // that are available to the state
    widget.onAdd(
      newTitle,
      newAmount,
      newDate,
    );

    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
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
                autofocus: true,
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleInputController,
                onSubmitted: (_) => _onSubmit(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountInputController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSubmitted: (_) => _onSubmit(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _openDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: _onSubmit,
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
