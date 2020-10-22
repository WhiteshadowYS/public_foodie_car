import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class SubscribeToStoresUpdatesAction extends BaseAction {
  final int id;
  final void Function(int, int) getData;

  SubscribeToStoresUpdatesAction({
    @required this.id,
    @required this.getData,
  }) : super(type: 'SubscribeToStoresUpdatesAction');
}
