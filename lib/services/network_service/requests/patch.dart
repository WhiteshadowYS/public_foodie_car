import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pictures_view/services/network_service/models/base_http_response.dart';

import '../abstracts/base_request_type.dart';
import '../network_service.dart';

class Patch extends BaseRequestType {

  @override
  Future<BaseHttpResponse> call({
    @required url,
    Map<String, String> headers,
    body,
  }) async {
    return await NetworkService.instance.request(
      http.patch(
        url,
        headers: headers,
        body: body,
      ),
    );
  }
}