import 'package:http/http.dart' as http;

abstract class BaseRequestType {
  Future<http.Response> call();
}