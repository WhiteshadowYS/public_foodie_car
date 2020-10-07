import 'package:flutter/material.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() navigateToTermsPage;
  final void Function() getData;
  final void Function(String id) checkId;

  final List<InfoCatalogModel> catalogs;
  final String catalogId;
  final CustomTheme theme;
  final AVColors colors;

  MainPageVM({
    @required this.navigateToTermsPage,
    @required this.catalogs,
    @required this.getData,
    @required this.theme,
    @required this.colors,
    @required this.catalogId,
    @required this.checkId,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      // TODO(Andrey): Add catalogs load from Store;
      catalogs: dummyCatalogs,
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
      getData: StorageSelector.getDataFunction(store),
      theme: CustomTheme.instance,
      colors: CustomTheme.colors,
      catalogId: '',
      checkId: StorageSelector.getCheckIdFunction(store),
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
