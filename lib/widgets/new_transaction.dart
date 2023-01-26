import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTr;

  NewTransaction(this.addTr);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData(){
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if(enterTitle.isEmpty || enterAmount <= 0){
      return;
    }

    // access addtr properties even though
    widget.addTr(
      enterTitle,
      enterAmount,
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
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData,

              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              // onChanged: (val) => amountInput = val,
            ),
            TextButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
