import 'package:http/http.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';

abstract class IBaseRequest {
  Future<Response> call();
}