import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CatalogsPageVM {
  final void Function() navigateToCategoriesPage;
  final void Function(String message) errorDialog;

  const CatalogsPageVM({
    @required this.navigateToCategoriesPage,
    @required this.errorDialog,
  });

  static CatalogsPageVM fromStore(Store<AppState> store) {
    return CatalogsPageVM(
      navigateToCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
      errorDialog: DialogSelectors.getShowErrorDialogFunction(store),
    );
  }
}