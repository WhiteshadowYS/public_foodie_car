import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class CategoriesPageVM {
  final void Function(int) navigateToSubcategoriesPage;
  final CategoryModel Function(int) getCurrentCategoryData;
  final List<InfoCategoryModel> categories;
  final String currentLocale;

  const CategoriesPageVM({
    @required this.navigateToSubcategoriesPage,
    @required this.currentLocale,
    @required this.categories,
    @required this.getCurrentCategoryData,
  });

  static CategoriesPageVM fromStore(Store<AppState> store) {
    return CategoriesPageVM(
      navigateToSubcategoriesPage: RouteSelectors.gotoSubcategoriesPage(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      categories: StorageSelector.getInfoCategories(store),
      getCurrentCategoryData: StorageSelector.getCurrentCategoryModelFunction(store),
    );
  }
}
