import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoSetStoresHistoryAction extends BaseAction {
  final List<SavedStorageModel> storesHistory;

  DoSetStoresHistoryAction({
    @required this.storesHistory,
  }) : super(type: 'DoSetStoresHistoryAction');
}