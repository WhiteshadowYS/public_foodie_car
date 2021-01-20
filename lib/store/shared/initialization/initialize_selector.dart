import 'package:foodie_client_template/data/res/locales.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/city_state/actions/save_cityList_action.dart';
import 'package:foodie_client_template/store/city_state/actions/save_city_action.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';
import 'package:foodie_client_template/store/shared/language_state/actions/change_language_action.dart';
import 'package:redux/redux.dart';

abstract class InitializeSelectors {
  static void startInitialization(Store<AppState> store) {
    FlutterDictionary.instance.setNewLanguage(Locales.base);
    return store.dispatch(
      StartInitialization(
        selectLanguageFunction: (String locale) {
          store.dispatch(
            ChangeLanguageAction(
              locale: locale,
            ),
          );
        },
        selectCityFunction: (City city) {
          store.dispatch(
            SaveCityAction(city: city),
          );
        },
        saveCityListFunction: (List<City> cityList) {
          store.dispatch(
            SaveCityListAction(cityList: cityList),
          );
        },
      ),
    );
  }
}
