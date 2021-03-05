import 'package:flutter/material.dart';
import 'package:projeto2/http/Web_clients/Transaction_webClient.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/models/transaction.dart';
import 'package:projeto2/screens/Transaction/transactions_list.dart';

class TransactionForm extends StatefulWidget {
  final Contact contact;
  TransactionForm(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _valueController = TextEditingController();
  TransactionWebClient apiTransaction = TransactionWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contact.nome,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.numero.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Value'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('Transfer'), onPressed: () async{
                      final double value = double.tryParse(_valueController.text);
                      final transactionCreated = Transaction(value, widget.contact);

                      Transaction transactionResponse = await apiTransaction.saveTransaction(transactionCreated);

                      if(transactionResponse != null){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>TransactionsList()), (route) => route.isFirst);
                      }
                  },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
