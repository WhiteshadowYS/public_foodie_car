import 'package:foodie_car_template/domain/functional_services/route_service/models/routes.dart';
import 'package:foodie_car_template/domain/functional_services/route_service/route_service.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

class RouteSelectors {
  static bool get canPop => RouteService.instance.canPop;

  static NavigateToAction get pop => RouteService.instance.pop();

  static NavigateToAction get gotoSplashScreenAction => RouteService.instance.pushAndRemoveUntil(Routes.splash_screen);

  static NavigateToAction get gotoHomePageAction => RouteService.instance.pushAndRemoveUntil(Routes.home_page);
  static NavigateToAction get gotoLoginPageAction => RouteService.instance.pushAndRemoveUntil(Routes.login_page);

  static void Function() doPop(Store<AppState> store) {
    if (canPop) {
      return () => store.dispatch(pop);
    }

    return () => store.dispatch(gotoHomePageAction);
  }

  static void Function() gotoHomePage(Store<AppState> store) {
    return () => store.dispatch(gotoHomePageAction);
  }

  static void Function() gotoSplashScreen(Store<AppState> store) {
    return () => store.dispatch(gotoSplashScreenAction);
  }

  static void Function() gotoLoginPage(Store<AppState> store) {
    return () => store.dispatch(gotoLoginPageAction);
  }

  static void Function(String) getGotoRoute(Store<AppState> store) {
    return (String route) => store.dispatch(_getActionForRoute(route));
  }

  static void Function(NavigateToAction) getDoRouteFunction(Store<AppState> store) {
    return (NavigateToAction action) => store.dispatch(action);
  }

  static void Function(String) getPushToWithArgumentsFunction(Store<AppState> store) {
    return (String route) {
      store.dispatch(RouteService.instance.push(route));
    };
  }

  static NavigateToAction _getActionForRoute(String route) {
    switch (route) {
      case Routes.home_page:
        return gotoHomePageAction;
      case Routes.login_page:
        return gotoLoginPageAction;
      case Routes.splash_screen:
        return gotoSplashScreenAction;

      default:
        return gotoHomePageAction;
    }
  }
}
