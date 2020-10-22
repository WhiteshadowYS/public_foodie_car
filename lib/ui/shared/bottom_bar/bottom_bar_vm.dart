import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class BottomBarVM {
  final int currentIndex;
  final List<FooterButtonModel> footerButtons;
  final void Function() removeOpenedStore;
  final void Function() navigateToSettingsPage;
  final void Function() navigateToMainPage;
  final void Function() navigateToCatalogsPage;
  final void Function(int) navigateCategoryPage;

  BottomBarVM({
    @required this.currentIndex,
    @required this.footerButtons,
    @required this.navigateCategoryPage,
    @required this.navigateToMainPage,
    @required this.navigateToSettingsPage,
    @required this.removeOpenedStore,
    @required this.navigateToCatalogsPage,
  });

  static BottomBarVM fromStore(Store<AppState> store) {
    return BottomBarVM(
      /// StorageDataSelector
      currentIndex: StorageDataSelector.getCurrentCatalogID(store),
      footerButtons: StorageDataSelector.getFooterButtons(store),

      /// StorageFunctionSelector
      navigateToMainPage: StorageFunctionSelector.getLogOutFunction(store),
      removeOpenedStore: StorageFunctionSelector.getRemoveOpenedStorageFunction(store),

      /// Another
      navigateCategoryPage: RouteSelectors.gotoCategoriesPage(store),
      navigateToCatalogsPage: RouteSelectors.gotoCatalogsPage(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }
}
