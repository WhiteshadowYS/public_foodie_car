import 'package:pictures_view/services/network_service/models/base_http_response.dart';
import 'package:pictures_view/services/network_service/res/typedef.dart';

abstract class IBaseHttpRequest {
  Future<BaseHttpResponse> request(HttpRequestFunction requestFunction);
}