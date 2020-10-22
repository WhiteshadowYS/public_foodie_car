import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoGetDataAction extends BaseAction {
  final int update;
  final int id;

  DoGetDataAction({
    @required this.update,
    @required this.id,
  }) : super(type: 'DoGetDataAction');
}
