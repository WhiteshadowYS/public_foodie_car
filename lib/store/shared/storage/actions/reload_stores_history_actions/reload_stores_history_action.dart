import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class ReloadStoresHistoryAction extends BaseAction {
  final int newStoreId;
  final String error;

  ReloadStoresHistoryAction({
    @required this.newStoreId,
    @required this.error,
  }) : super(type: 'ReloadStoresHistoryAction');
}
