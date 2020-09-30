import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class TermsPageVM {
  final void Function() navigateToCatalogsPage;

  const TermsPageVM({
    @required this.navigateToCatalogsPage,
  });

  static TermsPageVM fromStore(Store<AppState> store) {
    return TermsPageVM(
      navigateToCatalogsPage: RouteSelectors.gotoCatalogsPage(store),
    );
  }
}