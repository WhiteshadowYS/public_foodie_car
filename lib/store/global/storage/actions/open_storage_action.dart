import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class OpenStorageAction extends BaseAction {
  final String id;
  final StorageModel storage;

  OpenStorageAction({
    @required this.id,
    @required this.storage,
  }) : super(type: 'OpenStorageAction');
}
