import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';

import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/initialization/actions/start_initialization.dart';

class InitializeEpics {
  static final indexEpic = combineEpics<AppState>([
    startInitializationEpic,
  ]);

  static Stream<dynamic> startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<StartInitialization>().switchMap((action) {
      return Stream.fromFuture(
        Future.delayed(Duration(seconds: 3)).then((_) {
          NavigateToAction action = RouteSelectors.gotoMainPageAction;

          print('action: $action');

          return action;
        }),
      );
    });
  }
}
