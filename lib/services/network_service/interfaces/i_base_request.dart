import 'package:http/http.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';

/// Interface of BaseRequests. All main examples of [IBaseRequest] contains in [RequestBuilders] class.
abstract class IBaseRequest {
  Future<Response> call();
}