import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pictures_view/services/network_service/models/base_http_response.dart';

import '../interfaces/i_base_request.dart';
import '../network_service.dart';

class Get implements IBaseRequest {

  @override
  Future<BaseHttpResponse> call({
    @required url,
    Map<String, String> headers,
  }) async {
    return await NetworkService.instance.request(
      http.get(
        url,
        headers: headers,
      ),
    );
  }
}