import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainLayoutVM {
  final void Function(NavigateToAction) doRoute;

  MainLayoutVM({
    @required this.doRoute,
  });

  static MainLayoutVM fromStore(Store<AppState> store) {
    return MainLayoutVM(
      doRoute: RouteSelectors.getDoRouteFunction(store),
    );
  }
}