import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function onAdd;

  NewTransaction(this.onAdd);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void onSubmit() {
    final newTitle = titleInputController.text;
    final newAmount = double.parse(amountInputController.text);

    if (newTitle.isEmpty || newAmount <= 0) {
      return;
    }

    // widget and context are special properties
    // that are available to the state
    widget.onAdd(
      newTitle,
      newAmount,
    );

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
              autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInputController,
              onSubmitted: (_) => onSubmit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInputController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => onSubmit(),
            ),
            FlatButton(
              onPressed: onSubmit,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
