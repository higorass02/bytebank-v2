import 'package:flutter/material.dart';
import 'package:projeto2/screens/dasborad.dart';
import 'package:projeto2/screens/contactlist.dart';
import 'package:projeto2/screens/formcontact.dart';

void main() {
  runApp(bayteBankApp());
}

class bayteBankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blue[700],
        buttonTheme:	ButtonThemeData(
          buttonColor:	Colors.blueAccent[700],
          textTheme:	ButtonTextTheme.primary,
        )
      ),
      home: Dashborad()
    );
  }
}

