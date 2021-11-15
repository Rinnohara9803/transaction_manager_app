import 'package:flutter/material.dart';
import 'package:transaction_app/models/transaction.dart';
import 'package:transaction_app/utils/database.dart';
import 'package:transaction_app/widgets/chart.dart';
import 'package:transaction_app/widgets/new_transaction.dart';
import 'package:transaction_app/widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Transactiona> get _transactions {
  //   return DatabaseProvider.db.getTransactions();
  // }

  List<Transactiona> _transactions = [];

  List<Transactiona> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void addNewTransaction(
    String txid,
    String txtitle,
    int txamount,
    DateTime txDate,
  ) {
    var theNewTransaction = Transactiona(
      id: txid,
      title: txtitle,
      amount: txamount,
      date: txDate,
    );

    setState(() {
      _transactions.add(theNewTransaction);
    });

    Navigator.pop(context);
  }

  void deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void startAddNewTransaction(BuildContext theContext) {
    showModalBottomSheet(
        context: theContext,
        builder: (context) {
          return NewTransaction(addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            startAddNewTransaction(context);
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Transaction Application',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                startAddNewTransaction(context);
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Chart(_recentTransactions),
              TransactionList(_transactions, deleteTransaction),
            ],
          ),
        ),
      ),
    );
  }
}
