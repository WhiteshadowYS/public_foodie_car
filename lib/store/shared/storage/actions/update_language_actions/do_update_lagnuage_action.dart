import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoUpdateLanguageAction extends BaseAction {
  final SavedStorageModel newModel;

  DoUpdateLanguageAction({
    @required this.newModel,
  }) : super(type: 'DoUpdateLanguageAction');
}
