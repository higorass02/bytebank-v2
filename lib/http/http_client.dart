import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:projeto2/models/contact.dart';
import 'package:projeto2/models/transaction.dart';

class LoggingInterceptor implements InterceptorContract {

  Future<RequestData> interceptRequest({RequestData data}) async{
    // debugPrint('Request: ${data.method} ${data.url}');
    // debugPrint('Headers: ${data.headers}');
    // debugPrint('Body: ${data.body}');

    return data;
  }

  Future<ResponseData> interceptResponse({ResponseData data}) async{
    // debugPrint('Request: ${data.statusCode} ${data.url}');
    // debugPrint('Headers: ${data.headers}');
    // debugPrint('Body: ${data.body}');

    return data;
  }
}

Future<List<Transaction>> findAllTransaction () async{
  HttpClientWithInterceptor client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
  );

  Response response = await client.get('http://192.168.1.103:8080/transactions').timeout(Duration(seconds:5));
  List<Transaction> transactions = List();

  List<dynamic> jsonArray = jsonDecode(response.body);

  for(Map<String, dynamic> transactionJson in jsonArray){
    Map<String, dynamic> contactJson = transactionJson['contact'];

    Transaction transaction = Transaction(transactionJson['value'], Contact(contactJson['nome'],contactJson['accountNumber']),id: transactionJson['id']);
    transactions.add(transaction);
  }
  return transactions;
}
