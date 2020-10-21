import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckUpdateResultAction extends BaseAction {
  final bool isLastUpdate;

  CheckUpdateResultAction({
    @required this.isLastUpdate,
  }) : super(type: 'CheckUpdateResultAction');
}
