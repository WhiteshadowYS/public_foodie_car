import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class GetDataAction extends BaseAction {
  final String storageId;

  GetDataAction({
    @required this.storageId,
  }) : super(type: 'GetDataAction');
}
