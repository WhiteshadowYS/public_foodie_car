import 'package:my_catalog/services/network_service/models/base_http_error.dart';

class BaseHttpResponse {
  final BaseHttpError error;

  final dynamic response;

  BaseHttpResponse({
    this.error,
    this.response,
  });
}
