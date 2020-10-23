import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class CategoriesPageVM {
  final bool isLanguagePopupNeeded;

  final String currentLocale;
  final bool isSimpleCatalog;
  final List<InfoCategoryModel> categories;
  final void Function() openLanguagePopup;
  final void Function(int) navigateToSubcategoriesPage;
  final String Function(String) categoriesPageTitle;
  final String Function(String) backButtonText;
  final CategoryModel Function(int) getCurrentCategoryData;

  const CategoriesPageVM({
    @required this.categories,
    @required this.isSimpleCatalog,
    @required this.currentLocale,
    @required this.backButtonText,
    @required this.categoriesPageTitle,
    @required this.getCurrentCategoryData,
    @required this.navigateToSubcategoriesPage,
    @required this.isLanguagePopupNeeded,
    @required this.openLanguagePopup,
  });

  static CategoriesPageVM fromStore(Store<AppState> store) {
    return CategoriesPageVM(
      /// StorageDataSelector
      categories: StorageDataSelector.getInfoCategories(store),
      isSimpleCatalog: StorageDataSelector.getIsSimpleCatalog(store),

      /// StorageLanguageSelector
      currentLocale: StorageLanguageSelector.getSelectedLocale(store),
      backButtonText: StorageLanguageSelector.getBackButtonText(store),
      categoriesPageTitle: StorageLanguageSelector.getCategoriesTitleText(store),
      isLanguagePopupNeeded: StorageLanguageSelector.getIsLanguagePopupNeeded(store),

      /// StorageFunctionSelector
      getCurrentCategoryData: StorageFunctionSelector.getCurrentCategoryModelFunction(store),
      openLanguagePopup: StorageLanguageSelector.getOpenLanguageDialogFunction(store),

      /// Another
      navigateToSubcategoriesPage: RouteSelectors.gotoSubcategoriesPage(store),
    );
  }
}
