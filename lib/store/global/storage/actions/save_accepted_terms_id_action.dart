import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SaveAcceptedTermsIdAction extends BaseAction {
  final int id;
  final StorageModel storage;

  SaveAcceptedTermsIdAction({
    @required this.id,
    @required this.storage,
  }) : super(type: 'SaveAcceptedTermsIdAction');
}
