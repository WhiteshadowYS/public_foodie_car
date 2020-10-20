import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
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
    @required this.navigateCatalogPage,
    @required this.navigateToMainPage,
    @required this.navigateToSettingsPage,
    @required this.removeOpenedStore,
    @required this.navigateToCatalogsPage,
  });

  static BottomBarVM fromStore(Store<AppState> store) {
    return BottomBarVM(
      // TODO(Daniil): Use selector for this
      footerButtons: StorageSelector.getFooterButtons(store),//dummyButtons,
      navigateCatalogPage: RouteSelectors.gotoCatalogsPage(store),
      navigateToMainPage: StorageSelector.getLogOutFunction(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
      removeOpenedStore: StorageSelector.getRemoveOpenedStorageFunction(store),
      navigateToCatalogsPage: RouteSelectors.gotoCatalogsPage(store),
    );
  }



}
