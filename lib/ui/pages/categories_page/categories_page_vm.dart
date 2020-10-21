import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class CategoriesPageVM {
  final void Function(int) navigateToSubcategoriesPage;
  final CategoryModel Function(int) getCurrentCategoryData;
  final List<InfoCategoryModel> categories;
  final String currentLocale;
  final String Function(String) categoriesPageTitle;
  final String Function(String) backButtonText;

  const CategoriesPageVM({
    @required this.navigateToSubcategoriesPage,
    @required this.currentLocale,
    @required this.categories,
    @required this.getCurrentCategoryData,
    @required this.categoriesPageTitle,
    @required this.backButtonText,
  });

  static CategoriesPageVM fromStore(Store<AppState> store) {
    return CategoriesPageVM(
      navigateToSubcategoriesPage: RouteSelectors.gotoSubcategoriesPage(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      categories: StorageSelector.getInfoCategories(store),
      backButtonText: StorageSelector.getBackButtonText(store),
      categoriesPageTitle: StorageSelector.getCategoriesTitleText(store),
      getCurrentCategoryData: StorageSelector.getCurrentCategoryModelFunction(store),
    );
  }
}
