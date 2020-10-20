import 'package:my_catalog/models/models/storage_model/data/data/file_model.dart';
import 'package:my_catalog/services/dialog_service/models/error_dialog.dart';
import 'package:my_catalog/services/dialog_service/models/exit_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:my_catalog/store/shared/dialog_state/actions/show_dialog_action.dart';
import 'package:my_catalog/ui/pages/single_product_page/widgets/dialog_widgets/file_preview_dialog/file_preview_dialog.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Update comment for this class.
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

  static void Function(FileModel file ) getShowFilePreviewDialogFunction(Store<AppState> store) {
    return (FileModel file) => store.dispatch(ShowDialogAction(dialog: FilePreviewDialog(file: file)));
  }

  static void Function(String logoUrl) getExitDialogFunction(Store<AppState> store) {
    return (String logoUrl) => store.dispatch(ShowDialogAction(dialog: ExitDialog(logoUrl: logoUrl)));
  }
}
