import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateLanguageAction extends BaseAction {
  final SavedStorageModel newModel;

  UpdateLanguageAction({
    @required this.newModel,
  }) : super(type: 'UpdateLanguageAction');
}
