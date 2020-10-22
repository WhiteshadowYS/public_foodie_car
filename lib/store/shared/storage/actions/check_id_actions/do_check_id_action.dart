import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoCheckIdAction extends BaseAction {
  final int id;

  DoCheckIdAction({
    @required this.id,
  }) : super(type: 'DoCheckIdAction');
}
