import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SetOpenedStoreIdAction extends BaseAction {
  final int storeId;

  SetOpenedStoreIdAction({
    @required this.storeId,
  }) : super(type: 'SetOpenedStoreIdAction');
}
