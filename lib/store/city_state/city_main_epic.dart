import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/data_services/city_service.dart';
import 'package:foodie_client_template/store/city_state/actions/get_cityList_action.dart';
import 'package:foodie_client_template/store/city_state/actions/save_cityList_action.dart';
import 'package:foodie_client_template/store/city_state/actions/save_city_action.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

class CityMainEpic {
  static const String tag = '[InitializeEpics]';

  static final indexEpic = combineEpics<AppState>([
    _getCityListEpic,
    _saveCityToStorageEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getCityListEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<GetCityListAction>().switchMap((action) async* {
      final _service = dependencyContainer.get<CityService>();

      final result = await _service.getCityList();

      if (result != null && result.isNotEmpty) {
        yield SaveCityListAction(
          cityList: result,
        );
      }
    });
  }

  static Stream<dynamic> _saveCityToStorageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SaveCityAction>().switchMap((action) async* {
      final _service = dependencyContainer.get<CityService>();

      await _service.saveCity(action.city);
    });
  }
}
