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
        return FlutterDictionary.instance.language.homePageTitle;
      case Routes.about_page:
        return FlutterDictionary.instance.language.aboutPageTitle;
      case Routes.categories_page:
        return FlutterDictionary.instance.language.categoriesPageTitle;
      case Routes.busket_page:
        return FlutterDictionary.instance.language.busketPageTitle;
      case Routes.splash_screen:
        return FlutterDictionary.instance.language.splashScreenTitle;
      case Routes.gallery_page:
        return FlutterDictionary.instance.language.galleryPageTitle;
      default:
        return 'Default Title';
    }
  }
}
