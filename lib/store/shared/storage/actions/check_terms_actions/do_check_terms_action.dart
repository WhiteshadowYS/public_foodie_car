import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class DoCheckTermsAction extends BaseAction {
  final int id;

  DoCheckTermsAction({
    @required this.id,
  }) : super(type: 'DoCheckTermsAction');
}
