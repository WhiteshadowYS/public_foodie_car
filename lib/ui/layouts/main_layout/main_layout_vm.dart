import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

///[MainLayoutVM] view model for MainLayout
///[doRoute] - void function with params: [NavigateToAction]

class MainLayoutVM {
  final void Function(NavigateToAction) doRoute;
  final TextDirection direction;

  MainLayoutVM({
    @required this.doRoute,
    @required this.direction,
  });

  static MainLayoutVM fromStore(Store<AppState> store) {
    return MainLayoutVM(
      doRoute: RouteSelectors.getDoRouteFunction(store),
      direction: StorageLanguageSelector.selectedLocaleDirection(store),
    );
  }
}