import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_function_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
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
