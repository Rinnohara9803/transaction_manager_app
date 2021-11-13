import 'package:flutter/material.dart';
import 'package:transaction_app/models/transaction.dart';
import 'package:transaction_app/widgets/new_transaction.dart';
import 'package:transaction_app/widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 'rino9803',
    //   title: 'Private Purpose',
    //   amount: 40,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 'rino9802',
    //   title: 'School Fee Payment',
    //   amount: 29,
    //   date: DateTime.now(),
    // ),
  ];

  void addNewTransaction(String txtitle, int txamount) {
    final newTransaction = Transaction(
      id: 'rino9803',
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.pop(context);
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
              // Container(
              //   margin: const EdgeInsets.all(
              //     8,
              //   ),
              //   height: 50,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).colorScheme.primary,
              //     borderRadius: BorderRadius.circular(
              //       5,
              //     ),
              //   ),
              // ),
              TransactionList(_transactions),
            ],
          ),
        ),
      ),
    );
  }
}
