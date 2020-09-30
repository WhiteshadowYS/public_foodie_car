import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() navigateToTermsPage;

  const MainPageVM({
    @required this.navigateToTermsPage,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
    );
  }
}