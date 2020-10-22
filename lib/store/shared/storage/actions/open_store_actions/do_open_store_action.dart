import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoOpenStoreAction extends BaseAction {
  final int id;
  final StorageModel storage;

  DoOpenStoreAction({
    @required this.id,
    @required this.storage,
  }) : super(type: 'DoOpenStoreAction');
}
