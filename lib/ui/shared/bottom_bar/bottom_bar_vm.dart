import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[BottomBarVM] view model for BottomBar
///[currentIndex] - int with current index which is taken from [StorageDataSelector.getCurrentCatalogID].
///[footerButtons] - list with [FooterButtonModel] which is taken from [StorageDataSelector.getFooterButtons].
///[removeOpenedStore] - void function for removing opened store which is taken  function from [StorageFunctionSelector.getRemoveOpenedStorageFunction].
///[navigateToSettingsPage] - void function for navigation to settings page which is taken from [RouteSelectors.gotoSettingsPage].
///[navigateToMainPage] - void function for navigation to main page which is taken from [StorageFunctionSelector.getLogOutFunction].
///[navigateToCatalogsPage] - void function for navigation to catalogs page which is taken from [RouteSelectors.gotoCatalogsPage].
///[navigateCategoryPage] - void function with int param for navigation to categories page which is taken from [RouteSelectors.gotoCategoriesPage].
///[selectedLocale] show current locale

class BottomBarVM {
  final int currentIndex;
  final String selectedLocale;
  final List<FooterButtonModel> footerButtons;
  final void Function() navigateToSettingsPage;
  final void Function() getLogoutFunction;
  final void Function() navigateToCatalogsPage;
  final void Function(int) navigateCategoryPage;

  BottomBarVM({
    @required this.currentIndex,
    @required this.selectedLocale,
    @required this.footerButtons,
    @required this.navigateCategoryPage,
    @required this.getLogoutFunction,
    @required this.navigateToSettingsPage,
    @required this.navigateToCatalogsPage,
  });

  static BottomBarVM fromStore(Store<AppState> store) {
    return BottomBarVM(
      /// StorageDataSelector
      currentIndex: StorageDataSelector.getCurrentCatalogID(store),
      footerButtons: StorageDataSelector.getFooterButtons(store),

      /// StorageLanguageSelector
      selectedLocale: StorageLanguageSelector.getSelectedLocale(store),

      /// StorageFunctionSelector
      getLogoutFunction: StorageFunctionSelector.getLogOutFunction(store),

      /// Another
      navigateCategoryPage: RouteSelectors.gotoCategoriesPage(store),
      navigateToCatalogsPage: RouteSelectors.gotoCatalogsPage(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }
}
