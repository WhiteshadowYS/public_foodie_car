import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/models/routes.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/route_service.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

class RouteSelectors {
  static bool get canPop => RouteService.instance.canPop;

  static NavigateToAction get pop => RouteService.instance.pop();

  static NavigateToAction get gotoSplashScreenAction => RouteService.instance.pushAndRemoveUntil(Routes.splash_screen);

  static NavigateToAction get gotoHomePageAction => RouteService.instance.pushAndRemoveUntil(Routes.home_page);
  static NavigateToAction get gotoGalleryPageAction => RouteService.instance.push(Routes.gallery_page);
  static NavigateToAction get gotoCategoriesPageAction => RouteService.instance.push(Routes.categories_page);
  static NavigateToAction get gotoProductsPageAction => RouteService.instance.push(Routes.products_page);
  static NavigateToAction get gotoProductPageAction => RouteService.instance.push(Routes.product_page);
  static NavigateToAction get gotoProfilePageAction => RouteService.instance.pushAndRemoveUntil(Routes.profile_page);

  static NavigateToAction get gotoAboutPageActon => RouteService.instance.push(Routes.about_page);
  static NavigateToAction get gotoBusketPageAction => RouteService.instance.push(Routes.busket_page);

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

  static void Function() gotoAboutPage(Store<AppState> store) {
    return () => store.dispatch(gotoAboutPageActon);
  }

  static void Function() gotoGalleryPage(Store<AppState> store) {
    return () => store.dispatch(gotoGalleryPageAction);
  }

  static void Function() gotoCategoriesPage(Store<AppState> store) {
    return () => store.dispatch(gotoCategoriesPageAction);
  }

  static void Function() gotoBusketPage(Store<AppState> store) {
    return () => store.dispatch(gotoBusketPageAction);
  }

  static void Function() gotoProductsPage(Store<AppState> store) {
    return () => store.dispatch(gotoProductsPageAction);
  }

  static void Function() gotoProductPage(Store<AppState> store) {
    return () => store.dispatch(gotoProductPageAction);
  }

  static void Function() gotoProfilePage(Store<AppState> store) {
    return () => store.dispatch(gotoProfilePageAction);
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
      case Routes.about_page:
        return gotoAboutPageActon;
      case Routes.gallery_page:
        return gotoGalleryPageAction;
      case Routes.categories_page:
        return gotoCategoriesPageAction;
      case Routes.busket_page:
        return gotoBusketPageAction;
      case Routes.splash_screen:
        return gotoSplashScreenAction;
      case Routes.product_page:
        return gotoProductPageAction;
      case Routes.products_page:
        return gotoProductsPageAction;
      case Routes.profile_page:
        return gotoProfilePageAction;

      default:
        return gotoHomePageAction;
    }
  }
}
