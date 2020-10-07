import 'package:flutter/material.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckIdAction extends BaseAction {
  final String storageId;

  CheckIdAction({
    @required this.storageId,
  }) : super(type: 'CheckIdAction');
}
