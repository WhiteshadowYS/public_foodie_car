import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class ReloadStoresHistoryResultAction extends BaseAction {
  final List<SavedStorageModel> history;

  ReloadStoresHistoryResultAction({
    @required this.history,
  }) : super(type: 'ReloadStoresHistoryResultAction');
}
