import 'package:flutter/material.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/interfaces/i_loader.dart';
import 'package:foodie_client_template/store/application/app_selectors.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';
import 'package:foodie_client_template/store/shared/loader/loader_selectors.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainLayoutVM {
  final List<ILoader> loaders;
  final String title;
  final String selectedPage;
  final TextDirection textDirection;

  final void Function() pop;
  final void Function() gotoBusketPage;
  final void Function() gotoAboutPage;
  final void Function(String) gotoPage;
  MainLayoutVM({
    @required this.loaders,
    @required this.title,
    @required this.selectedPage,
    @required this.textDirection,
    @required this.pop,
    @required this.gotoPage,
    @required this.gotoAboutPage,
    @required this.gotoBusketPage,
  });

  static MainLayoutVM init(Store<AppState> store) {
    return MainLayoutVM(
      loaders: LoaderSelectors.getLoaders(store),
      title: AppSelectors.getTitleForPage(store),
      selectedPage: AppSelectors.getSelectedPage(),
      pop: RouteSelectors.doPop(store),
      textDirection: LanguageSelector.getCurrentTextDirection(store),
      gotoPage: RouteSelectors.getGotoRoute(store),
      gotoAboutPage: RouteSelectors.gotoAboutPage(store),
      gotoBusketPage: RouteSelectors.gotoBusketPage(store),
    );
  }
}
