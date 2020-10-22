import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckIdResultAction extends BaseAction {
  BaseHttpResponse<StorageStatusModel> response;

  CheckIdResultAction({
    @required this.response,
  }) : super(type: 'CheckIdResultAction');
}
