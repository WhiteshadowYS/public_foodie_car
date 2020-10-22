import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateOpenedStoreIdAction extends BaseAction {
  final int id;

  UpdateOpenedStoreIdAction({
    @required this.id,
  }) : super(type: 'UpdateOpenedStoreIdAction');
}
