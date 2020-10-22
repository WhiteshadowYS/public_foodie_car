import 'package:flutter/material.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateIsFirstOpenAction extends BaseAction {
  final bool isFirstOpen;

  UpdateIsFirstOpenAction({
    @required this.isFirstOpen,
  }) : super(type: 'UpdateIsFirstOpenAction');
}
