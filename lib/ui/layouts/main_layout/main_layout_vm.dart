import 'package:base_project_template/dictionary/models/language.dart';
import 'package:base_project_template/res/locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:base_project_template/store/application/app_state.dart';
import 'package:base_project_template/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

///[MainLayoutVM] view model for MainLayout
///[doRoute] - void function with params: [NavigateToAction]
class MainLayoutVM {
  final Locale locale;
  final Language language;
  final TextDirection textDirection;
  final void Function(NavigateToAction) doRoute;

  MainLayoutVM({
    @required this.doRoute,
    @required this.locale,
    @required this.textDirection,
    @required this.language,
  });

  static MainLayoutVM fromStore(Store<AppState> store) {
    return MainLayoutVM(
      locale: Locale(Locales.base),
      language: Language(),
      textDirection: TextDirection.ltr,
      doRoute: RouteSelectors.getDoRouteFunction(store),
    );
  }
}