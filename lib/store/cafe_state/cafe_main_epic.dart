import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/data_services/cafe_service.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/default_loader_dialog.dart';
import 'package:foodie_client_template/store/cafe_state/actions/get_cafe_for_city.dart';
import 'package:foodie_client_template/store/cafe_state/actions/save_cafe_for_city.dart';
import 'package:foodie_client_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

class CafeMainEpic {
  static const String tag = '[CafeMainEpic]';

  static final indexEpic = combineEpics<AppState>([
    _getCafeForCityEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getCafeForCityEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetCafeForCity>().switchMap((action) async* {
      yield StartLoadingAction(
        loader: DefaultLoaderDialog(
          state: true,
          loaderKey: LoaderKey.global,
        ),
      );

      final _service = dependencyContainer.get<CafeService>();

      final result = await _service.getCafeListForCity();

      if (result != null && result.isNotEmpty) {
        yield SaveCafeForCity(
          cafeList: result,
        );
      } else {
        yield SaveCafeForCity(
          cafeList: [],
        );
      }
      yield StopLoadingAction(loaderKey: LoaderKey.global);
    });
  }
}
