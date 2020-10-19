import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/catalog_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/dialog_state/dialog_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CatalogsPageVM {
  final void Function() logOut;
  final void Function(int) navigateToCategoriesPage;
  final void Function(String logoUrl) exitDialog;
  final CatalogModel Function(int) getCurrentCatalogData;
  final List<InfoCatalogModel> catalogs;
  final String currentLocale;


  const CatalogsPageVM({
    @required this.logOut,
    @required this.navigateToCategoriesPage,
    @required this.exitDialog,
    @required this.catalogs,
    @required this.getCurrentCatalogData,
    @required this.currentLocale,
  });

  static CatalogsPageVM fromStore(Store<AppState> store) {
    return CatalogsPageVM(
      logOut: StorageSelector.getLogOutFunction(store),
      catalogs: StorageSelector.getInfoCatalogs(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      navigateToCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
      exitDialog: DialogSelectors.getExitDialogFunction(store),
      getCurrentCatalogData: StorageSelector.getCurrentCatalogModelFunction(store),
    );
  }
}
