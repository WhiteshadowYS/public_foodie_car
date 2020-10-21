import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SetStoresHistoryAction extends BaseAction {
  final List<SavedStorageModel> storesHistory;

  SetStoresHistoryAction({
    @required this.storesHistory,
  }) : super(type: 'SetStoresHistoryAction');
}
