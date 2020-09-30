import 'package:redux/redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:my_catalog/res/typedef.dart';

import 'package:my_catalog/handler/route_handler.dart';
import 'package:my_catalog/models/models/route_info.dart';

import 'package:my_catalog/store/application/app_state.dart';

class RouteSelectors {
  static NavigateToFunction navigateTo(Store<AppState> store) {
    return (RouteInfo routeInfo) {
      return store.dispatch(RouteHandler.instance.navigateTo(routeInfo));
    };
  }

  static PopFunction pop(Store<AppState> store) {
    return () => store.dispatch(RouteHandler.instance.pop());
  }

  static PopFunction popDialog(Store<AppState> store) {
    return () => store.dispatch(NavigateToAction.pop());
  }
}
