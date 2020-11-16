import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';
import 'package:base_project_template/services/network_service/interfaces/i_base_request.dart';

class PostRequestModel implements IBaseRequest {
  final String url;
  final Map<String, String> headers;
  final Map<String, String> body;

  PostRequestModel({
    this.url,
    this.headers,
    this.body,
  });

  @override
  Future<Response> call() {
    return http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );
  }
}
