import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[CatalogsPageVM] view model for CatalogsPage
///[logoUrl] - string with logo url which is taken from [StorageDataSelector.getLogoUrl].
///[currentLocale] - string with current locale which is taken from [StorageLanguageSelector.getSelectedLocale].
///[catalogs] - list with catalogs which is taken from [StorageDataSelector.getInfoCatalogs].
///[logOut] - void function for logout which is taken  function from [StorageFunctionSelector.getLogOutFunction].
///[openLanguagePopup] - void function for opening language dialog which is taken  function from [StorageLanguageSelector.getOpenLanguageDialogFunction].
///[navigateToCategoriesPage] - void function with int param for navigation to categories page which is taken from [RouteSelectors.gotoCategoriesPage].
///[exitDialog] - void function for opening exit dialog which is taken  function from [DialogSelectors.getExitDialogFunction].
///[logoutText] - void function with string param for getting logout text from [StorageLanguageSelector.getLogoutText].
///[descriptionTitleText] - void function with string param for getting description title text from [StorageLanguageSelector.getDescriptionText].
///[getCurrentCatalogData] - this function return [CatalogModel] and takes the int param. This function is taken from [StorageFunctionSelector.getCurrentCatalogModelFunction].

class CatalogsPageVM {
  final bool isLanguagePopupNeeded;

  final String logoUrl;
  final String currentLocale;
  final List<InfoCatalogModel> catalogs;

  final void Function() logOut;
  final void Function() openLanguagePopup;
  final void Function(int) navigateToCategoriesPage;
  final void Function() exitDialog;
  final String Function(String) logoutText;
  final String Function(String) descriptionTitleText;
  final CatalogModel Function(int) getCurrentCatalogData;

  const CatalogsPageVM({
    @required this.logOut,
    @required this.logoUrl,
    @required this.catalogs,
    @required this.exitDialog,
    @required this.logoutText,
    @required this.currentLocale,
    @required this.openLanguagePopup,
    @required this.descriptionTitleText,
    @required this.getCurrentCatalogData,
    @required this.isLanguagePopupNeeded,
    @required this.navigateToCategoriesPage,
  });

  static CatalogsPageVM fromStore(Store<AppState> store) {
    return CatalogsPageVM(
      /// StorageDataSelector functions
      logoUrl: StorageDataSelector.getLogoUrl(store),
      catalogs: StorageDataSelector.getInfoCatalogs(store),

      /// StorageLanguageSelector functions
      logoutText: StorageLanguageSelector.getLogoutText(store),
      currentLocale: StorageLanguageSelector.getSelectedLocale(store),
      openLanguagePopup: StorageLanguageSelector.getOpenLanguageDialogFunction(store),
      descriptionTitleText: StorageLanguageSelector.getDescriptionText(store),
      isLanguagePopupNeeded: StorageLanguageSelector.getIsLanguagePopupNeeded(store),

      /// StorageFunctionSelector functions
      logOut: StorageFunctionSelector.getLogOutFunction(store),
      getCurrentCatalogData: StorageFunctionSelector.getCurrentCatalogModelFunction(store),

      /// Another
      navigateToCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
      exitDialog: DialogSelectors.getExitDialogFunction(store),
    );
  }
}
