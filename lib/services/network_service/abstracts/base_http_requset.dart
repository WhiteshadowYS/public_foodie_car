import 'package:http/http.dart' as http;
import 'package:pictures_view/services/network_service/models/base_http_response.dart';

abstract class BaseHttpRequest {
  Future<BaseHttpResponse> request(Future<http.Response> resp);
}