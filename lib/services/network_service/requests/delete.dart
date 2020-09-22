import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../abstracts/base_request_type.dart';

class Delete extends BaseRequestType {

  @override
  Future<http.Response> call({
    @required url,
    Map<String, String> headers,
  }) async {
    return await http.delete(
      url,
      headers: headers,
    );
  }
}