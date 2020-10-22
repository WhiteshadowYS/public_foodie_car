import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class BottomBarVM {
  final List<FooterButtonModel> footerButtons;
  final void Function() removeOpenedStore;
  final void Function() navigateCatalogPage;
  final void Function() navigateToSettingsPage;
  final void Function() navigateToMainPage;
  final void Function() navigateToCatalogsPage;

  BottomBarVM({
    @required this.footerButtons,
    @required this.removeOpenedStore,
    @required this.navigateToMainPage,
    @required this.navigateCatalogPage,
    @required this.navigateToSettingsPage,
    @required this.navigateToCatalogsPage,
  });

  static BottomBarVM fromStore(Store<AppState> store) {
    return BottomBarVM(
      /// StorageDataSelector
      footerButtons: StorageDataSelector.getFooterButtons(store),

      /// StorageFunctionSelector
      navigateToMainPage: StorageFunctionSelector.getLogOutFunction(store),
      removeOpenedStore: StorageFunctionSelector.getRemoveOpenedStorageFunction(store),

      /// Another
      navigateCatalogPage: RouteSelectors.gotoCatalogsPage(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
      navigateToCatalogsPage: RouteSelectors.gotoCatalogsPage(store),
    );
  }
}
