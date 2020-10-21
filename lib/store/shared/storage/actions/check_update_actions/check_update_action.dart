import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckUpdateAction extends BaseAction {
  final StorageStatusModel model;

  CheckUpdateAction({
    @required this.model,
  }) : super(type: 'CheckUpdateAction');
}
