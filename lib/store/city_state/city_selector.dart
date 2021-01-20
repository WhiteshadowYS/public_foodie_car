import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/city_state/actions/get_cityList_action.dart';
import 'package:redux/redux.dart';

abstract class CitySelector {
  static String getSelectedCityName(Store<AppState> store) {
    return store.state.cityState.selectedCity?.name ?? '';
  }

  static void Function() getLoadCityListFunction(Store<AppState> store) {
    return () => store.dispatch(GetCityListAction());
  }
}
