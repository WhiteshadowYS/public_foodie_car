import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:base_project_template/services/route_service/models/routes.dart';
import 'package:base_project_template/services/route_service/route_service.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

class RouteSelectors {
  static bool get canPop => RouteService.instance.canPop;

  static NavigateToAction get pop => RouteService.instance.pop();

  static NavigateToAction get gotoMainPageAction => RouteService.instance.pushAndRemoveUntil(Routes.main);

  static void Function() doPop(Store<AppState> store) {
    if (canPop) {
      return () => store.dispatch(pop);
    }

    return () => store.dispatch(gotoMainPageAction);
  }

  static void Function() gotoMainPage(Store<AppState> store) {
    return () => store.dispatch(gotoMainPageAction);
  }

  static void Function(NavigateToAction) getDoRouteFunction(Store<AppState> store) {
    return (NavigateToAction action) => store.dispatch(action);
  }
}
