import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function(String) checkId;
  final List<InfoCatalogModel> catalogs;

  MainPageVM({
    @required this.catalogs,
    @required this.checkId,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      checkId: StorageSelector.getCheckIdFunction(store),
      catalogs: dummyCatalogs,
    );
  }

  static List<InfoCatalogModel> dummyCatalogs = [
    InfoCatalogModel(
      id: 1254,
      categories: [],
      displayedIn: [],
    ),
    InfoCatalogModel(
      id: 123432,
      categories: [],
      displayedIn: [],
    ),
    InfoCatalogModel(
      id: 3214,
      categories: [],
      displayedIn: [],
    ),
    InfoCatalogModel(
      id: 5234,
      categories: [],
      displayedIn: [],
    ),
    InfoCatalogModel(
      id: 25432,
      categories: [],
      displayedIn: [],
    ),
  ];
}
