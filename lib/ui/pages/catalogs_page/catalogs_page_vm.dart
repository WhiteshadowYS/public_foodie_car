import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class CatalogsPageVM {
  final void Function() logOut;
  final void Function() internetDialog;
  final void Function(int) navigateToCategoriesPage;
  final void Function(String logoUrl) exitDialog;
  final CatalogModel Function(int) getCurrentCatalogData;
  final List<InfoCatalogModel> catalogs;
  final String Function(String) logoutText;
  final String Function(String) descriptionTitleText;
  final String currentLocale;
  final String logoUrl;

  final bool isLanguagePopupNeeded;
  final void Function() openLanguagePopup;

  const CatalogsPageVM({
    @required this.logOut,
    @required this.internetDialog,
    @required this.navigateToCategoriesPage,
    @required this.exitDialog,
    @required this.catalogs,
    @required this.logoutText,
    @required this.getCurrentCatalogData,
    @required this.currentLocale,
    @required this.descriptionTitleText,
    @required this.logoUrl,
    @required this.isLanguagePopupNeeded,
    @required this.openLanguagePopup,

  });

  static CatalogsPageVM fromStore(Store<AppState> store) {
    return CatalogsPageVM(
      logoutText: StorageSelector.getLogoutText(store),
      logoUrl: StorageSelector.getLogoUrl(store),
      logOut: StorageSelector.getLogOutFunction(store),
      catalogs: StorageSelector.getInfoCatalogs(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      descriptionTitleText: StorageSelector.getDescriptionText(store),
      navigateToCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
      exitDialog: DialogSelectors.getExitDialogFunction(store),
      getCurrentCatalogData: StorageSelector.getCurrentCatalogModelFunction(store),
      isLanguagePopupNeeded: StorageSelector.getIsLanguagePopupNeeded(store),
      openLanguagePopup: StorageSelector.getOpenLanguageDialogFunction(store),
      internetDialog: DialogSelectors.getInternetConnectionDialogFunction(store),
    );
  }
}
