import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/dropdown_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:redux/redux.dart';

class NextButtonPageViewModel {
  final void Function(String) showErrorDialog;
  final void Function() closeDialog;
  final void Function(DropdownModel) showDropdownDialog;

  NextButtonPageViewModel({
    @required this.showErrorDialog,
    @required this.closeDialog,
    @required this.showDropdownDialog,
  });

  static NextButtonPageViewModel fromStore(Store<AppState> store) {
    return NextButtonPageViewModel(
      closeDialog: DialogSelectors.getCloseDialogFunction(store),
      showErrorDialog: DialogSelectors.getShowErrorDialogFunction(store),
      showDropdownDialog: DialogSelectors.getShowDropdownDialogFunction(store),
    );
  }
}
