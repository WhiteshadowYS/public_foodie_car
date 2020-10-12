import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SubcategoriesPageVM {
  final void Function() navigateToProductsPage;

  const SubcategoriesPageVM({
    @required this.navigateToProductsPage,
  });

  static SubcategoriesPageVM fromStore(Store<AppState> store) {
    return SubcategoriesPageVM(
      navigateToProductsPage: RouteSelectors.gotoProductsPage(store),
    );
  }
}
