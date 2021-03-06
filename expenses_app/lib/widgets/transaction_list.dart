import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  Function _onDeleteTx(String id) {
    return () => deleteTx(id);
  }

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, idx) {
              return TransactionItem(
                transaction: transactions[idx],
                deleteTx: _onDeleteTx,
              );
            },
          );
  }
}
