import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';

import 'abstracts/base_http_requset.dart';
import 'abstracts/base_request_type.dart';
import 'models/base_http_error.dart';
import 'models/base_http_response.dart';
import 'res/consts.dart';

class NetworkService extends BaseHttpRequest {
  NetworkService._privateConstructor();

  static final NetworkService _instance = NetworkService._privateConstructor();

  static NetworkService get instance => _instance;

  @override
  Future<BaseHttpResponse> request(BaseRequestType req) async {
    bool hasInternet = await DataConnectionChecker().hasConnection;

    if (!hasInternet) {
      return BaseHttpResponse(
        error: BaseHttpError(
          error: 'No Internet Connection',
          statusCode: BAD_GATEWAY_STATUS_CODE,
        ),
      );
    }

    http.Response response = await req();

    return _getCheckedForErrorResponse(response);
  }

  // region [Check response for error]
  static BaseHttpResponse _getCheckedForErrorResponse(http.Response response) {

    if (response.statusCode < HTTP_OK || response.statusCode > HTTP_MAX_OK) {
      return BaseHttpResponse(
        error: BaseHttpError(
          error: response?.reasonPhrase,
          statusCode: response?.statusCode,
        ),
      );
    }

    if (response.statusCode == HTTP_UNPROCESSABLE) {
      String error;

      try {

      } catch (e) {
        return BaseHttpResponse(
          error: BaseHttpError(
            error: response?.reasonPhrase,
            statusCode: response?.statusCode,
          ),
        );
      }

      return BaseHttpResponse(
        error: BaseHttpError(
          error: error,
          statusCode: response?.statusCode,
        ),
      );
    }

    return BaseHttpResponse(
      response: jsonDecode(response.body),
    );
  }
  // endregion
}

