import 'package:flutter/material.dart';
import 'package:projeto2/components/centered_message.dart';
import 'package:projeto2/components/loading.dart';
import 'package:projeto2/components/transactionCard.dart';
import 'package:projeto2/http/http_client.dart';
import 'package:projeto2/models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body:FutureBuilder<List<Transaction>>(
        // future: Future.delayed(Duration(seconds: 3)).then((value) => findAllContact()),
        future: findAllTransaction(),
        builder: (context,snapshot){

          switch(snapshot.connectionState){

            case ConnectionState.none:
            // Ainda nao foi disparado nenhuma chamada assincrona
            case ConnectionState.waiting:
              return Loading();
            case ConnectionState.active:
            // Baixar um arquivo
            // carregar barra de progresso
            // processamento ainda nao finalizado
            case ConnectionState.done:
              if(snapshot.hasError){
                return CenteredMessage('Error on fetching transaction', icon: Icons.error);
              }

              List<Transaction> transactions = snapshot.data;
              if(transactions.length != 0){
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];
                    return TransactionsCard(transaction);
                  },
                  itemCount: transactions.length,
                );
              }

              if(transactions.isEmpty){
                return CenteredMessage('No transaction Found!',icon: Icons.warning);
              }
              break;
          }
          return null;
        },
      ),
    );
  }
}
