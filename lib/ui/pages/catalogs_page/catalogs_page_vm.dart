import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class CatalogsPageVM {
  final void Function() navigateToCategoriesPage;

  const CatalogsPageVM({
    @required this.navigateToCategoriesPage,
  });

  static CatalogsPageVM fromStore(Store<AppState> store) {
    return CatalogsPageVM(
      navigateToCategoriesPage: RouteSelectors.gotoCategoriesPage(store),
    );
  }
}