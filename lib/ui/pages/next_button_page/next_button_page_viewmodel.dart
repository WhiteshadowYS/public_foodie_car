import 'package:flutter/cupertino.dart';
import 'package:pictures_view/store/application/app_state.dart';
import 'package:pictures_view/store/shared/dialog_state/dialog_selector.dart';
import 'package:redux/redux.dart';

class NextButtonPageViewModel {
  final void Function(String) showErrorDialog;
  final void Function() closeDialog;

  NextButtonPageViewModel({
    @required this.showErrorDialog,
    @required this.closeDialog,
  });

  static NextButtonPageViewModel fromStore(Store<AppState> store) {
    return NextButtonPageViewModel(
      closeDialog: DialogSelectors.getCloseDialogFunction(store),
      showErrorDialog: DialogSelectors.getShowErrorDialogFunction(store),
    );
  }
}
