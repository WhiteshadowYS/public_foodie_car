import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/data/data/product_model.dart';
import 'package:my_catalog/res/dummy_data.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CategoriesPageVM {
  final void Function(String) navigateToSubcategoriesPage;
  // TODO(Daniil): Change type
  final List<ProductModel> getCategories;

  const CategoriesPageVM({
    @required this.navigateToSubcategoriesPage,
    @required this.getCategories,
  });

  static CategoriesPageVM fromStore(Store<AppState> store) {
    return CategoriesPageVM(
      navigateToSubcategoriesPage: RouteSelectors.gotoSubcategoriesPage(store),
      getCategories: dummyProducts,
    );
  }
}
