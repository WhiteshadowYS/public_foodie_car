import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SettingsPageVM {
  final void Function() navigateToTermsPage;

  const SettingsPageVM({
    @required this.navigateToTermsPage,
  });

  static SettingsPageVM fromStore(Store<AppState> store) {
    return SettingsPageVM(
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
    );
  }
}