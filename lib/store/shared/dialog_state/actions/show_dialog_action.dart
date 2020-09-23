import 'package:pictures_view/services/dialog_service/interfaces/i_dialog.dart';
import 'package:pictures_view/store/shared/base_action.dart';

class ShowDialogAction extends BaseAction {
  final IDialog dialog;

  ShowDialogAction({this.dialog}) : super(type: 'ShowDialogAction');
}
