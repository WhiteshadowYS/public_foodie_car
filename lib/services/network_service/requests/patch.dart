import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../abstracts/base_request_type.dart';

class Patch extends BaseRequestType {

  @override
  Future<http.Response> call({
    @required url,
    Map<String, String> headers,
    body,
  }) async {
    return await http.patch(
      url,
      headers: headers,
      body: body,
    );
  }
}