import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SubcategoriesPageVM {
  final void Function(String) navigateToProductsPage;
  // TODO(Daniil): Change type
  final List<ProductModel> getSubCategories;

  const SubcategoriesPageVM({
    @required this.navigateToProductsPage,
    @required this.getSubCategories,
  });

  static SubcategoriesPageVM fromStore(Store<AppState> store) {
    return SubcategoriesPageVM(
      navigateToProductsPage: RouteSelectors.gotoProductsPage(store),
      getSubCategories: dummyProducts,
    );
  }
}
