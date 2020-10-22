import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoReloadStoresHistoryAction extends BaseAction {
  final int newStoreId;

  DoReloadStoresHistoryAction({
    @required this.newStoreId,
  }) : super(type: 'DoReloadStoresHistoryAction');
}
