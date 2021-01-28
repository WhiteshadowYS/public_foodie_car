import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/dependency/injection_config.dart';
import 'package:foodie_car_template/domain/data_services/city_service.dart';
import 'package:foodie_car_template/store/city_state/actions/save_cityList_action.dart';

class OrdersMainEpic {
  static const String tag = '[InitializeEpics]';

  static final indexEpic = combineEpics<AppState>([
    _getOrdersEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _getOrdersEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<int>().switchMap((action) async* {
      final _service = dependencyContainer.get<CityService>();

      final result = await _service.getCityList();

      if (result != null && result.isNotEmpty) {
        yield SaveCityListAction(
          cityList: result,
        );
      }
    });
  }
}
