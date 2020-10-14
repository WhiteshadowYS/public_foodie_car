import 'package:flutter/material.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class UpdateLanguageAction extends BaseAction {
  final String locale;

  UpdateLanguageAction({
    @required this.locale,
  }) : super(type: 'UpdateLanguageAction');
}
