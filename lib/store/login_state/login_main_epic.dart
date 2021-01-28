import 'package:foodie_car_template/store/login_state/actions/login_action.dart';
import 'package:foodie_car_template/store/login_state/actions/save_token_action.dart';
import 'package:foodie_car_template/store/shared/route_selectors.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:foodie_car_template/store/shared/loader/loader_state.dart';
import 'package:foodie_car_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:foodie_car_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/default_loader_dialog.dart';

import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/shared/initialization/actions/start_initialization.dart';

class LoginMainEpic {
  static const String tag = '[CafeMainEpic]';

  static final indexEpic = combineEpics<AppState>([
    _loginToApp,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _loginToApp(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<LoginAction>().switchMap((action) async* {
      yield StartLoadingAction(
        loader: DefaultLoaderDialog(
          state: true,
          loaderKey: LoaderKey.global,
        ),
      );

      // final _service = dependencyContainer.get<CafeService>();

      await Future.delayed(Duration(seconds: 2));

      yield SaveTokenAction(token: 'token');

      yield StopLoadingAction(loaderKey: LoaderKey.global);

      yield RouteSelectors.gotoHomePageAction;
    });
  }
}
