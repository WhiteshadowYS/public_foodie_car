import 'package:flutter/cupertino.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class TermsPageVM {
  final void Function() navigateToCatalogsPage;
  final void Function() back;
  final String termsText;

  const TermsPageVM({
    @required this.navigateToCatalogsPage,
    @required this.back,
    @required this.termsText,
  });

  static TermsPageVM fromStore(Store<AppState> store) {
    return TermsPageVM(
      navigateToCatalogsPage: RouteSelectors.gotoCatalogsPage(store),
      back: RouteSelectors.doPop(store),
      termsText: PLACEHOLDER_TEXT, // TODO(Daniil): Create and use selector for this
    );
  }
}
