import 'package:pictures_view/dialogs/models/error_dialog.dart';
import 'package:pictures_view/store/application/app_state.dart';
import 'package:pictures_view/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:pictures_view/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:redux/redux.dart';

class DialogSelectors {
  static bool isDialogDisplayed(Store<AppState> store) {
    return store.state.dialogState.isDialogDisplayed;
  }

  static void Function() getCloseDialogFunction(Store<AppState> store) {
    return () {
      store.dispatch(
        ForceCloseDialogAction(),
      );
    };
  }

  static void Function(String message) getShowErrorDialogFunction(Store<AppState> store) {
    return (String message) {
      store.dispatch(ShowDialogAction(
        dialog: ErrorDialog(
          message: message,
        ),
      ));
    };
  }
}
