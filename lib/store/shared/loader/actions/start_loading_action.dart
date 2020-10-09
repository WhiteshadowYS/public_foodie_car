import 'package:flutter/material.dart';
import 'package:my_catalog/services/dialog_service/interfaces/i_loader.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class StartLoadingAction extends BaseAction {
  final ILoader loader;

  StartLoadingAction({
    @required this.loader,
  }) : super(type: 'StartLoadingAction');
}
