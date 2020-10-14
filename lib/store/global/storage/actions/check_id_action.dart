import 'package:flutter/material.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckIdAction extends BaseAction {
  final int id;
  final void Function(int, int) getData;

  CheckIdAction({
    @required this.id,
    @required this.getData,
  }) : super(type: 'CheckIdAction');
}
