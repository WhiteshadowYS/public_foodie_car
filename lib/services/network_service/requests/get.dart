import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pictures_view/services/network_service/interfaces/base_request_type.dart';
import 'package:pictures_view/services/network_service/models/base_http_response.dart';
import 'package:pictures_view/services/network_service/res/typedef.dart';

import '../network_service.dart';

class Get implements IBaseRequest {
  call() {}

  @override
  Future<BaseHttpResponse> req({
    @required url,
    Map<String, String> headers,
  }) async {
    final HttpRequestFunction request = () => http.get(
      url,
      headers: headers,
    );

    return await NetworkService.instance.request(
      request,
    );
  }
}