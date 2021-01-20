import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/models/routes.dart';
import 'package:foodie_client_template/domain/functional_services/route_service/route_service.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

abstract class AppSelectors {
  static String getSelectedPage() => RouteService.instance.currentRoute;

  static String getTitleForPage(Store<AppState> store) {
    switch (RouteService.instance.currentRoute) {
      case Routes.home_page:
        return FlutterDictionary.instance.language.homePage.title;
      case Routes.about_page:
        return FlutterDictionary.instance.language.aboutPage.title;
      case Routes.categories_page:
        return FlutterDictionary.instance.language.categoriesPage.title;
      case Routes.busket_page:
        return FlutterDictionary.instance.language.busketPage.title;
      case Routes.splash_screen:
        return 'Hello';
      case Routes.gallery_page:
        return FlutterDictionary.instance.language.galleryPage.title;
      case Routes.product_page:
        return FlutterDictionary.instance.language.productPage.title;
      case Routes.products_page:
        return FlutterDictionary.instance.language.productsPage.title;
      case Routes.profile_page:
        return FlutterDictionary.instance.language.profilePage.title;
      default:
        return 'Default Title';
    }
  }
}
