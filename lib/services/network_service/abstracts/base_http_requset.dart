import 'package:pictures_view/services/network_service/models/base_http_response.dart';
import 'base_request_type.dart';

abstract class BaseHttpRequest {
  Future<BaseHttpResponse> request(BaseRequestType req);
}