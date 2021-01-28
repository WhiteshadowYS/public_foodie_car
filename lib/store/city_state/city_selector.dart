import 'package:redux/redux.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/city_state/actions/get_cityList_action.dart';

abstract class CitySelector {
  static String getSelectedCityName(Store<AppState> store) {
    return store.state.cityState.selectedCity?.name ?? '';
  }

  static void Function() getLoadCityListFunction(Store<AppState> store) {
    return () => store.dispatch(GetCityListAction());
  }
}
