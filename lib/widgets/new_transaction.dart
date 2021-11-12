import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({Key? key}) : super(key: key);

  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    void submitData() {
      final titleText = titleController.text;
      var amount = int.tryParse(amountController.text) ?? 0;

      if (titleText.isEmpty || amount <= 0) {
        return;
      }
      addTransaction(
        titleText,
        amount,
      );
    }

    return Container(
      height: 500,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                keyboardType: TextInputType.name,
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                onSubmitted: (_) {
                  submitData();
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                onSubmitted: (_) {
                  submitData();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: submitData,
                child: const Text(
                  'Add Transaction',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
