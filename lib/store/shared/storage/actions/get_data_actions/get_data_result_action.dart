import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class GetDataResultAction extends BaseAction {
  final BaseHttpResponse<StorageModel> response;

  GetDataResultAction({
    @required this.response,
  }) : super(type: 'GetDataResultAction');
}
