import 'package:flutter/foundation.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class CheckTermsResultActon extends BaseAction {
  final bool isTermsAccepted;

  CheckTermsResultActon({
    @required this.isTermsAccepted,
  }) : super(type: 'CheckTermsResultActon');
}
