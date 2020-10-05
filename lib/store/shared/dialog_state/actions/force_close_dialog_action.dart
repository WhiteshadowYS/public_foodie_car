import 'package:my_catalog/store/shared/base_action.dart';

/// Action need it for close any dialogs.
class ForceCloseDialogAction extends BaseAction {
  ForceCloseDialogAction() : super(type: 'ForceCloseDialogAction');
}
