import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CategoriesPageVM {
  final void Function() navigateToSubcategoriesPage;

  const CategoriesPageVM({
    @required this.navigateToSubcategoriesPage,
  });

  static CategoriesPageVM fromStore(Store<AppState> store) {
    return CategoriesPageVM(
      navigateToSubcategoriesPage: RouteSelectors.gotoSubcategoriesPage(store),
    );
  }
}
