import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateTokenAction extends BaseAction {
  final int id;
  final String language;

  UpdateTokenAction({
    @required this.id,
    @required this.language,
  }) : super(type: 'UpdateTokenAction');
}
