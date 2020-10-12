import 'package:flutter/material.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckIdAction extends BaseAction {
  final String storageId;
  final void Function(String) getData;

  CheckIdAction({
    @required this.storageId,
    @required this.getData,
  }) : super(type: 'CheckIdAction');
}
