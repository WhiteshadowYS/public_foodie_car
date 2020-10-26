import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/services/network_service/interfaces/i_base_http_error.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckUpdateAction extends BaseAction {
  final StorageStatusModel model;
  final IBaseHttpError error;

  CheckUpdateAction({
    @required this.model,
    @required this.error,
  }) : super(type: 'CheckUpdateAction');
}
