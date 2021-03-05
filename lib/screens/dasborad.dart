import 'package:flutter/material.dart';
import 'package:projeto2/components/CardBtn.dart';
import 'package:projeto2/screens/Contact/contactlist.dart';
import 'package:projeto2/screens/Transaction/transactions_list.dart';

class Dashborad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          mainAxisAlignment: 	MainAxisAlignment.spaceBetween,
          crossAxisAlignment:	CrossAxisAlignment.start,
          children: [
            Padding(
              padding:const EdgeInsets.all(8.0),
              child: Image.asset('images/bytebank_logo.png'),
            ),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row( children: [
                    CardBtn('Transfer',Icons.monetization_on,onClick: () {
                      _showTransactionList(context);
                      }
                    ),
                    CardBtn('Transaction	Feed',Icons.description, onClick: () {
                      _showFeedTransaction(context);
                    }),
                    // CardBtn('Transaction	Feed',Icons.description, onClick: () {
                    //   debugPrint('teste btn 3');
                    // }),
                  ]),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  void _showFeedTransaction(BuildContext context) {
    Navigator.of(context).push( MaterialPageRoute(builder: (ctx) => TransactionsList()) );
  }

  void _showTransactionList(BuildContext context) {
    Navigator.of(context).push( MaterialPageRoute(builder: (ctx) => ContactList()) );
  }
}