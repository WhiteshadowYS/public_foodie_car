import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/models/models/storage_model/data/data/subcategory_model.dart';
import 'package:my_catalog/models/models/storage_model/data/info_subcategory_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SubcategoriesPageVM {
  final void Function(int) navigateToProductsPage;
  final SubcategoryModel Function(int) getCurrentSubCategoryData;
  final List<InfoSubcategoryModel> subCategories;
  final String currentLocale;

  const SubcategoriesPageVM({
    @required this.navigateToProductsPage,
    @required this.currentLocale,
    @required this.subCategories,
    @required this.getCurrentSubCategoryData,
  });

  static SubcategoriesPageVM fromStore(Store<AppState> store) {
    return SubcategoriesPageVM(
      navigateToProductsPage: RouteSelectors.gotoProductsPage(store),
      currentLocale: StorageSelector.getSelectedLocale(store),
      subCategories: StorageSelector.getInfoSubCategories(store),
      getCurrentSubCategoryData: StorageSelector.getCurrentSubCategoryModelFunction(store),
    );
  }
}
