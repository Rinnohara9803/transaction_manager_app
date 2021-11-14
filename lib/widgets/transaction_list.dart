import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transaction_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function deleteTransaction;

  TransactionList(
    this.transactionList,
    this.deleteTransaction,
  );

  // void deleteParticularTransaction(int i) {
  //   deleteTransaction(i);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width: double.infinity,
      child: transactionList.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'No Transactions added yet!!!',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactionList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                        ),
                        child: FittedBox(
                          child: Text(
                            '\$ ${transactionList[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactionList[index].title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactionList[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        deleteTransaction(transactionList[index].id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
