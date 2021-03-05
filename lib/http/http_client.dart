import 'dart:convert';

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

final HttpClientWithInterceptor client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);



final String baseUrl = 'http://192.168.1.103:8080/transactions';

Future<List<Transaction>> findAllTransaction () async{
  Response response = await client.get(baseUrl).timeout(Duration(seconds:5));
  List<Transaction> transactions = List();

  List<dynamic> jsonArray = jsonDecode(response.body);

  for(Map<String, dynamic> transactionJson in jsonArray){
    Map<String, dynamic> contactJson = transactionJson['contact'];

    Transaction transaction = Transaction(transactionJson['value'], Contact(contactJson['nome'],contactJson['accountNumber']),id: transactionJson['id']);
    transactions.add(transaction);
  }
  return transactions;
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

  Map<String, dynamic> trasactionJson = jsonDecode(response.body);


  Transaction resposeTransaction = Transaction (
      trasactionJson['value'],
    Contact(
      trasactionJson['contact']['name'],
      trasactionJson['contact']['accountNumber'],
    ),
    id: trasactionJson['id']
  );

  return resposeTransaction;
}