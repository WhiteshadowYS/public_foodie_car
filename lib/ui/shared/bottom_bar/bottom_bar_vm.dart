import 'package:flutter/foundation.dart';
import 'package:my_catalog/models/models/storage_model/settings/footer_button_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class BottomBarVM {
  final List<FooterButtonModel> footerButtons;
  final void Function() navigateCatalogPage;
  final void Function() navigateToSettingsPage;
  final void Function() navigateToMainPage;

  BottomBarVM({
    @required this.footerButtons,
    @required this.navigateCatalogPage,
    @required this.navigateToMainPage,
    @required this.navigateToSettingsPage,
  });

  static BottomBarVM fromStore(Store<AppState> store) {
    return BottomBarVM(
      // TODO(Daniil): Use selector for this
      footerButtons: dummyButtons,
      navigateCatalogPage: RouteSelectors.gotoCatalogsPage(store),
      navigateToMainPage: RouteSelectors.gotoMainPage(store),
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }



}