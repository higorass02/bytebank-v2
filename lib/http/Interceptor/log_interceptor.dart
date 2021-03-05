import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:projeto2/http/http_client.dart';

final HttpClientWithInterceptor client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
);