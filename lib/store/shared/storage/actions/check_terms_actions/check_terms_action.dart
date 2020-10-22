import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckTermsAction extends BaseAction {
  final int id;
  final SavedStorageModel model;

  CheckTermsAction({
    @required this.id,
    @required this.model,
  }) : super(type: 'CheckTermsAction');
}
