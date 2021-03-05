import 'dart:convert';
import 'package:http/http.dart';
import 'package:projeto2/http/Interceptor/log_interceptor.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/models/transaction.dart';

class TransactionWebClient {
  final String baseUrl = 'http://192.168.1.103:8080/transactions';

  _toTransaction(transactionJson,contactJson){
    return Transaction(transactionJson['value'], Contact(contactJson['nome'],contactJson['accountNumber']),id: transactionJson['id']);
  }
  _toList(response){
    List<Transaction> transactions = List();
    List<dynamic> jsonArray = jsonDecode(response.body);

    for(Map<String, dynamic> transactionJson in jsonArray){
      Map<String, dynamic> contactJson = transactionJson['contact'];

      Transaction transaction = _toTransaction(transactionJson,contactJson);
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<List<Transaction>> findAllTransaction () async{
    Response response = await client.get(baseUrl).timeout(Duration(seconds:5));
    return _toList(response);
  }

  Transaction fromJson(response){
    Map<String, dynamic> trasactionJson = jsonDecode(response.body);
    return Transaction (
        trasactionJson['value'],
        Contact(
          trasactionJson['contact']['name'],
          trasactionJson['contact']['accountNumber'],
        ),
        id: trasactionJson['id']
    );
  }

  Future<Transaction> saveTransaction(Transaction transaction) async{
    final Map<String, String> headersH = {
      'Content-Type':'application/json',
      'password':'1000'
    };
    Map<String, dynamic> transactMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.nome,
        'accountNumber': transaction.contact.numero
      }
    };
    Response response = await client.post(baseUrl,headers: headersH,body: jsonEncode(transactMap));
    return fromJson(response);
  }
}