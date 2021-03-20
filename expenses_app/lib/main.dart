import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      title: 'Expensy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 9.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 49.99,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 99.99,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 49.99,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 99.99,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _onAddTransaction(String txTitle, double txAmount, DateTime txDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      date: txDate,
      title: txTitle,
      amount: txAmount,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_onAddTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() => _userTransactions.removeWhere((tx) => tx.id == id));
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('Expensy App'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showAddNewTransaction(context),
        ),
      ],
    );

    final uiHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final txListWidget = Container(
      height: uiHeight * 0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );

    final txChartWidget = (double height) {
      return Container(
        height: uiHeight * height,
        child: Chart(_recentTransactions),
      );
    };

    return Scaffold(
      appBar: appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: _showChart,
                      onChanged: (val) {
                        setState(() {
                          _showChart = val;
                        });
                      })
                ],
              ),
            if (!isLandscape) txChartWidget(0.3),
            if (!isLandscape) txListWidget,
            if (isLandscape) _showChart ? txChartWidget(0.7) : txListWidget,
          ],
        ),
      ),
    );
  }
}
