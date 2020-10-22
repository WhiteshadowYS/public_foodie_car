import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoUpdateStoresHistoryAction extends BaseAction {
  final int id;
  final int update;
  final StorageModel storageModel;
  final String locale;

  DoUpdateStoresHistoryAction({
    @required this.id,
    @required this.update,
    @required this.storageModel,
    this.locale,
  }) : super(type: 'DoUpdateStoresHistoryAction');
}
