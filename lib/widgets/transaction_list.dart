import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      //can use Listview instead of column tp scroll down
      child: transactions.isEmpty
          ? Column(
              children: [
                Text('No transactions added yet!',
                style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                    child: Image.asset(
                        'assets/images/empty-list.png',
                      fit: BoxFit.cover,
                     // alignment: Alignment.center,
                    ),),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 1,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              transactions[index].title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                DateFormat().format(transactions[index].date),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black38),
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              // children: transactions.map((tr) {
              //
              // }).toList(),
            ),
    );
  }
}
