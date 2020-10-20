import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/services/route_service/route_service.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/actions/set_opened_id_actions.dart';
import 'package:redux/redux.dart';

class RouteSelectors {
  static bool get canPop => RouteService.instance.canPop;

  static NavigateToAction get pop => RouteService.instance.pop();

  static NavigateToAction get gotoMainPageAction => RouteService.instance.replace(Routes.main);

  static NavigateToAction get gotoSettingsPageAction => RouteService.instance.push(Routes.settings);

  static NavigateToAction get gotoTermsPageAction => RouteService.instance.push(Routes.terms);

  static NavigateToAction get gotoCatalogsPageAction => RouteService.instance.pushAndRemoveUntil(Routes.catalogs);

  static NavigateToAction get gotoCategoriesPageAction => RouteService.instance.pushAndRemoveUntil(Routes.categories);

  static NavigateToAction get gotoSubcategoriesPageAction => RouteService.instance.push(Routes.subCategories);

  static NavigateToAction get gotoProductsPageAction => RouteService.instance.push(Routes.products);

  static NavigateToAction get gotoSingleProductPageAction => RouteService.instance.push(Routes.singleProduct);

  static void Function() doPop(Store<AppState> store) {
    if (canPop) {
      return () => store.dispatch(pop);
    }

    return () => store.dispatch(gotoMainPageAction);
  }

  static void Function() gotoMainPage(Store<AppState> store) {
    return () => store.dispatch(gotoMainPageAction);
  }

  static void Function() gotoSettingsPage(Store<AppState> store) {
    return () => store.dispatch(gotoSettingsPageAction);
  }

  static void Function() gotoTermsPage(Store<AppState> store) {
    return () => store.dispatch(gotoTermsPageAction);
  }

  static void Function() gotoCatalogsPage(Store<AppState> store) {
    return () => store.dispatch(gotoCatalogsPageAction);
  }

  static void Function(int) gotoCategoriesPage(Store<AppState> store) {
    return (int id) {
      store.dispatch(SetOpenedCatalogIdAction(id: id));
      store.dispatch(gotoCategoriesPageAction);
    };
  }

  static void Function(int) gotoSubcategoriesPage(Store<AppState> store) {
    return (int id) {
      store.dispatch(SetOpenedCategoryIdAction(id: id));
      store.dispatch(gotoSubcategoriesPageAction);
    };
  }

  static void Function(int) gotoProductsPage(Store<AppState> store) {
    return (int id) {
      store.dispatch(SetOpenedSubCategoryIdAction(id: id));
      store.dispatch(gotoProductsPageAction);
    };
  }

  static void Function(int) gotoSingleProductPage(Store<AppState> store) {
    return (int id) {
      store.dispatch(SetOpenedProductIdAction(id: id));
      store.dispatch(gotoSingleProductPageAction);
    };
  }

  static void Function(NavigateToAction) getDoRouteFunction(Store<AppState> store) {
    return (NavigateToAction action) => store.dispatch(action);
  }
}
