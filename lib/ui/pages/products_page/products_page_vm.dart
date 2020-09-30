import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class ProductsPageVM {
  final void Function() navigateToSingleProductPagePage;

  const ProductsPageVM({
    @required this.navigateToSingleProductPagePage,
  });

  static ProductsPageVM fromStore(Store<AppState> store) {
    return ProductsPageVM(
      navigateToSingleProductPagePage: RouteSelectors.gotoSingleProductPage(store),
    );
  }
}