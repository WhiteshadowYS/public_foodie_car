import 'package:base_project_template/domain/functional_services/dialog_service/interfaces/i_dialog.dart';
import 'package:base_project_template/store/shared/base_action.dart';

/// Action for show any dialogs what will extends from [IDialog] interface.
class ShowDialogAction extends BaseAction {
  final IDialog dialog;

  ShowDialogAction({this.dialog}) : super(type: 'ShowDialogAction');
}
