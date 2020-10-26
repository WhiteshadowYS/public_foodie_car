import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/category_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_category_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[CategoriesPageVM] view model for CategoriesPage
///[isLanguagePopupNeeded] - bool with info is LanguagePopUp needed which is taken from [StorageLanguageSelector.getIsLanguagePopupNeeded].
///[currentLocale] - string with current locale which is taken from [StorageLanguageSelector.getSelectedLocale].
///[isSimpleCatalog] - bool with info is only one catalog present which is taken from [StorageDataSelector.getIsSimpleCatalog].
///[categories] - list with categories which is taken from [StorageDataSelector.getInfoCategories].
///[openLanguagePopup] - void function for opening language dialog which is taken  function from [StorageLanguageSelector.getOpenLanguageDialogFunction].
///[navigateToSubcategoriesPage] - void function with int param for navigation to categories page which is taken from [RouteSelectors.gotoSubcategoriesPage].
///[categoriesPageTitle] - void function with string param for getting categories page title text from [StorageLanguageSelector.getCategoriesTitleText].
///[backButtonText] - void function with string param for getting text for back button from [StorageLanguageSelector.getBackButtonText].
///[getCurrentCategoryData] - this function return [CategoryModel] and takes the int param. This function is taken from [StorageFunctionSelector.getCurrentCategoryModelFunction].

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
