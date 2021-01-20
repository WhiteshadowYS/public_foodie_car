import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/store/cafe_state/cafe_selector.dart';
import 'package:foodie_client_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';

class HomePageVM {
  final bool isLoading;
  final String locale;
  final List<Cafe> cafeList;

  final void Function() gotoCategories;
  final void Function(Cafe) selectCafe;
  final void Function() getCafeList;

  const HomePageVM({
    this.isLoading,
    this.cafeList,
    this.locale,
    this.gotoCategories,
    this.selectCafe,
    this.getCafeList,
  });

  static HomePageVM init(Store<AppState> store) {
    return HomePageVM(
      isLoading: LoaderSelectors.getValueForLoadingKey(store, LoaderKey.global),
      cafeList: CafeSelector.getCafeList(store),
      locale: LanguageSelector.getCurrentLocale(store),
      gotoCategories: RouteSelectors.gotoCategoriesPage(store),
      selectCafe: CafeSelector.getSelectCafeFunction(store),
      getCafeList: CafeSelector.getCafeForCity(store),
    );
  }
}
