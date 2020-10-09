import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:redux/redux.dart';

/// [DialogSelectors] it class with static functions for work with Dialogs from Pages.
/// Functions:
///   - [isDialogDisplayed]. This function was get the current dialog status.
///   - [getCloseDialogFunction]. This function was get function for close any dialogs.
class DialogSelectors {
  static bool isDialogDisplayed(Store<AppState> store) {
    return store.state.dialogState.isDialogDisplayed;
  }

  static void Function() getCloseDialogFunction(Store<AppState> store) {
    return () {
      store.dispatch(ForceCloseDialogAction());
    };
  }

  static void Function(String message) getShowErrorDialogFunction(Store<AppState> store) {
    return (String message) => store.dispatch(ShowDialogAction(dialog: ErrorDialog(message: message)));
  }
}
