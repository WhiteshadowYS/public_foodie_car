import 'package:my_catalog/services/network_service/interfaces/i_base_http_error.dart';

class BaseHttpResponse {
  final IBaseHttpError error;

  final dynamic response;

  BaseHttpResponse({
    this.error,
    this.response,
  });
}
