import 'package:foodie_car_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_car_template/domain/functional_services/route_service/models/routes.dart';
import 'package:foodie_car_template/domain/functional_services/route_service/route_service.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

abstract class AppSelectors {
  static String getSelectedPage() => RouteService.instance.currentRoute;

  static String getTitleForPage(Store<AppState> store) {
    switch (RouteService.instance.currentRoute) {
      case Routes.home_page:
        return FlutterDictionary.instance.language.homePage.title;
      case Routes.login_page:
        return '';
      default:
        return 'Default Title';
    }
  }
}
