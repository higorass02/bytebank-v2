
import 'package:http_interceptor/http_interceptor.dart';

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