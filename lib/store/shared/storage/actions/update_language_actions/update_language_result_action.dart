import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateLanguageResultAction extends BaseAction {
  final List<SavedStorageModel> history;

  UpdateLanguageResultAction({
    @required this.history,
  }) : super(type: 'UpdateLanguageResultAction');
}
