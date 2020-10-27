import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SetLanguageAction extends BaseAction {
  final int id;
  final StorageModel model;

  SetLanguageAction({
    @required this.id,
    @required this.model,
  }) : super(type: 'SetLanguageAction');
}
