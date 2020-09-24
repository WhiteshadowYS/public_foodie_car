import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pictures_view/services/network_service/interfaces/i_base_request.dart';
import 'package:pictures_view/services/network_service/models/base_http_response.dart';

import '../network_service.dart';

class Delete implements IBaseRequest {

  @override
  Future<BaseHttpResponse> call({
    @required url,
    Map<String, String> headers,
  }) async {
    return await NetworkService.instance.request(
      http.delete(
        url,
        headers: headers,
      ),
    );
  }
}