import 'package:flutter/material.dart';
import 'package:foodie_client_template/store/application/app_selectors.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class MainLayoutVM {
  final String title;
  final String selectedPage;
  final void Function(String) gotoPage;
  MainLayoutVM({
    @required this.title,
    @required this.selectedPage,
    @required this.gotoPage,
  });

  static MainLayoutVM init(Store<AppState> store) {
    return MainLayoutVM(
      title: AppSelectors.getTitleForPage(store),
      selectedPage: AppSelectors.getSelectedPage(),
      gotoPage: RouteSelectors.getGotoRoute(store),
    );
  }
}
