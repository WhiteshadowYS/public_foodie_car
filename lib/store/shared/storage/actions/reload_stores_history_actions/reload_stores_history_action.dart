import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class ReloadStoresHistoryAction extends BaseAction {
  final int newStoreId;

  ReloadStoresHistoryAction({
    @required this.newStoreId,
  }) : super(type: 'ReloadStoresHistoryAction');
}
