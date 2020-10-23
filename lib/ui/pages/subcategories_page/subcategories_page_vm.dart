import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[SubcategoriesPageVM] view model for SubcategoriesPage
///[currentLocale] - string with current locale which is taken from [StorageLanguageSelector.getSelectedLocale].
///[subCategories] - list with [InfoSubcategoryModel] which is taken from [StorageDataSelector.getInfoSubCategories].
///[navigateToProductsPage] - void function with int param for navigation to products page which is taken from [RouteSelectors.gotoProductsPage].
///[subcategoriesPageTitle] - void function with String param for navigation to subCategories page which is taken from [StorageLanguageSelector.getSubcategoriesTitleText].
///[backButtonText] - void function with string param for getting text for back button from [StorageLanguageSelector.getBackButtonText].
///[getCurrentSubCategoryData] - this function return [SubcategoryModel] and takes the int param. This function is taken from [StorageFunctionSelector.getCurrentSubCategoryModelFunction].


class SubcategoriesPageVM {
  final String currentLocale;
  final List<InfoSubcategoryModel> subCategories;

  final void Function(int) navigateToProductsPage;
  final String Function(String) subcategoriesPageTitle;
  final String Function(String) backButtonText;
  final SubcategoryModel Function(int) getCurrentSubCategoryData;

  const SubcategoriesPageVM({
    @required this.currentLocale,
    @required this.subCategories,
    @required this.backButtonText,
    @required this.navigateToProductsPage,
    @required this.subcategoriesPageTitle,
    @required this.getCurrentSubCategoryData,
  });

  static SubcategoriesPageVM fromStore(Store<AppState> store) {
    return SubcategoriesPageVM(
      /// StorageDataSelector
      subCategories: StorageDataSelector.getInfoSubCategories(store),

      /// StorageLanguageSelector
      currentLocale: StorageLanguageSelector.getSelectedLocale(store),
      backButtonText: StorageLanguageSelector.getBackButtonText(store),
      subcategoriesPageTitle: StorageLanguageSelector.getSubcategoriesTitleText(store),

      /// StorageFunctionSelector
      getCurrentSubCategoryData: StorageFunctionSelector.getCurrentSubCategoryModelFunction(store),

      /// Another
      navigateToProductsPage: RouteSelectors.gotoProductsPage(store),
    );
  }
}
