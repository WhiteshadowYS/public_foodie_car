import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateStoresHistoryAction extends BaseAction {
  final int newStoreId;

  UpdateStoresHistoryAction({
    @required this.newStoreId,
  }) : super(type: 'UpdateStoresHistoryAction');
}
