import 'package:flutter/foundation.dart';

import 'package:redux/redux.dart';

import 'package:my_catalog/res/typedef.dart';

import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';


class BottomBarViewModel {
  final NavigateToFunction navigateTo;

  BottomBarViewModel({@required this.navigateTo,});

  static BottomBarViewModel fromStore(Store<AppState> store) {
    return BottomBarViewModel(
      navigateTo: RouteSelectors.navigateTo(store),
    );
  }
}