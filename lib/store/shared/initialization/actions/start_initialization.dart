import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class StartInitialization extends BaseAction {
  final void Function(int, int) getDataFunction;

  StartInitialization({
    @required this.getDataFunction,
  }) : super(type: 'StartInitialization');
}
