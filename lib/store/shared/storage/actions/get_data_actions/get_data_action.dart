import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class GetDataAction extends BaseAction {
  final int update;
  final int id;
  final bool isInitialLoad;

  GetDataAction({
    @required this.update,
    @required this.id,
    this.isInitialLoad = false,
  }) : super(type: 'GetDataAction');
}
