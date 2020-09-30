import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SingleProductPageVM {
  final void Function() navigateToSettingsPage;

  const SingleProductPageVM({
    @required this.navigateToSettingsPage,
  });

  static SingleProductPageVM fromStore(Store<AppState> store) {
    return SingleProductPageVM(
      navigateToSettingsPage: RouteSelectors.gotoSettingsPage(store),
    );
  }
}