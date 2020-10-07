import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() navigateToTermsPage;
  final void Function() getData;
  final void Function() showLoader;
  final void Function() stopDialog;

  const MainPageVM({
    @required this.navigateToTermsPage,
    @required this.getData,
    @required this.showLoader,
    @required this.stopDialog,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
      getData: StorageSelector.getDataFunction(store),
      showLoader: DialogSelectors.getShowLoadingDialogFunction(store),
      stopDialog: DialogSelectors.getCloseDialogFunction(store),
    );
  }
}