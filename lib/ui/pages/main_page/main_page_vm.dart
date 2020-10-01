import 'package:flutter/cupertino.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainPageVM {
  final void Function() navigateToTermsPage;
  final void Function() getData;

  const MainPageVM({
    @required this.navigateToTermsPage,
    @required this.getData,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
      getData: StorageSelector.getDataFunction(store),
    );
  }
}