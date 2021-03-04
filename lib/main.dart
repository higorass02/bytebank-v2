import 'package:flutter/material.dart';
import 'package:projeto2/http/http_client.dart';
import 'package:projeto2/screens/dasborad.dart';

void main() {
  runApp(BayteBankApp());
  findAllTransaction().then((transaction){
    debugPrint(transaction.toString());
  });
  //findAllContact().then((listaContato) { for (Contact C1 in listaContato) { MyCard(C1.nome.toString(),C1.numero.toString()); } });
}

class BayteBankApp extends StatelessWidget {
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

