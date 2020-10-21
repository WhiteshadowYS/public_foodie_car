import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoUpdateStoresHistoryAction extends BaseAction {
  final int newStoreId;

  DoUpdateStoresHistoryAction({
    @required this.newStoreId,
  }) : super(type: 'DoUpdateStoresHistoryAction');
}
