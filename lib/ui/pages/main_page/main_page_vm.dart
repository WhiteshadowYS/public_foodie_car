import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/info_catalog_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/pages/home_page/storage_id_text_field_state/storage_id_text_field_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/theme/models/appvesto_colors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() navigateToTermsPage;
  final void Function() getData;
  final void Function(String id) saveCatalogId;
  final List<InfoCatalogModel> catalogs;
  final String catalogId;
  final void Function() changeTheme;
  final CustomTheme theme;
  final AVColors colors;

  MainPageVM({
    @required this.navigateToTermsPage,
    @required this.catalogs,
    @required this.saveCatalogId,
    @required this.getData,
    @required this.changeTheme,
    @required this.theme,
    @required this.colors,
    @required this.catalogId,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      // TODO(Andrey): Add catalogs load from Store;
      catalogId: StorageIdTextFieldSelector.getCatalogId(store),
      catalogs: dummyCatalogs,
      saveCatalogId: StorageIdTextFieldSelector.setIdCatalogFunction(store),
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
      getData: StorageSelector.getDataFunction(store),
      changeTheme: () => CustomTheme.instance.setColorsFromJson({
        "buttons": "E74C3C",
        "accent_font": "E74C3C",
        "background": "5DB075",
        "font": "FFFFFF",
      }),
      theme: CustomTheme.instance,
      colors: CustomTheme.colors,
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