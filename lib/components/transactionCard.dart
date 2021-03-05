import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto2/models/transaction.dart';

class TransactionsCard extends StatelessWidget {
  final Transaction transaction;
  TransactionsCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
          transaction.value.toString(),
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          transaction.contact.numero.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

