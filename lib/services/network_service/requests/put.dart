import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pictures_view/services/network_service/interfaces/base_request_type.dart';
import 'package:pictures_view/services/network_service/models/base_http_response.dart';
import 'package:pictures_view/services/network_service/network_service.dart';
import 'package:pictures_view/services/network_service/res/typedef.dart';

class Put implements IBaseRequest {

  @override
  Future<BaseHttpResponse> call({
    @required url,
    Map<String, String> headers,
    body,
  }) async {
    final HttpRequestFunction request = () => http.put(
      url,
      headers: headers,
      body: body,
    );

    return await NetworkService.instance.request(
      request,
    );
  }
}