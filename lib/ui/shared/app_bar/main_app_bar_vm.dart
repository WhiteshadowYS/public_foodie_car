import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

///[MainAppbarVM] view model for MainAppbar
///[doRoute] - void function with [NavigateToAction] param for navigation which is taken from [RouteSelectors.getDoRouteFunction].

class MainAppbarVM {
  final void Function(NavigateToAction) doRoute;

  MainAppbarVM({
    @required this.doRoute,
  });

  static MainAppbarVM fromStore(Store<AppState> store) {
    return MainAppbarVM(
      doRoute: RouteSelectors.getDoRouteFunction(store),
    );
  }
}