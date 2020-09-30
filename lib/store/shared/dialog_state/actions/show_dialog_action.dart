import 'package:my_catalog/services/dialog_service/interfaces/i_dialog.dart';
import 'package:my_catalog/store/shared/base_action.dart';

class ShowDialogAction extends BaseAction {
  final IDialog dialog;

  ShowDialogAction({this.dialog}) : super(type: 'ShowDialogAction');
}
