import 'package:flutter/material.dart';
import 'package:projeto2/components/BtnContats.dart';
import 'package:projeto2/components/BtnTransaction.dart';

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
            Row(
              children: [
                BtnContats(),
                //BtnTransaction()
              ],
            ),
          ],
        ),
      )
    );
  }
}