import 'package:foodie_client_template/dependency/injection_config.dart';
import 'package:foodie_client_template/domain/data_services/city_service.dart';
import 'package:foodie_client_template/domain/data_services/language_service.dart';
import 'package:foodie_client_template/domain/data_services/products_service.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/choose_city_dialog.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/choose_language_dialog.dart';
import 'package:foodie_client_template/domain/functional_services/dialog_service/models/default_loader_dialog.dart';
import 'package:foodie_client_template/store/city_state/actions/save_cityList_action.dart';
import 'package:foodie_client_template/store/shared/language_state/actions/change_language_action.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:foodie_client_template/store/shared/route_selectors.dart';
import 'package:foodie_client_template/store/shared/loader/loader_state.dart';
import 'package:foodie_client_template/store/shared/loader/actions/stop_loading_action.dart';
import 'package:foodie_client_template/store/shared/loader/actions/start_loading_action.dart';
import 'package:foodie_client_template/store/shared/initialization/actions/start_initialization.dart';

/// [InitializeMainEpic] the main epic which is started for initialization.
/// The class [InitializeMainEpic], has only one static variable [indexEpic].
/// The variable [indexEpic], returns a sheet of [combineEpics] that stores one epic, [_startInitializationEpic].
class InitializeMainEpic {
  static const String tag = '[InitializeEpics]';

  static final indexEpic = combineEpics<AppState>([
    _startInitializationEpic,
  ]);

  /// Epic [_startInitializationEpic], reacts to action [StartInitialization] and starts initializing the entire application.
  /// At the end and at the beginning, a fuction is started, [_changeInitializationLoading], which changes the page load status.
  static Stream<dynamic> _startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<StartInitialization>().switchMap((action) async* {
      final _cityService = dependencyContainer.get<CityService>();
      final _languageService = dependencyContainer.get<LanguageService>();

      yield* _changeInitializationLoading(true);

      await Future.delayed(Duration(seconds: 1));

      yield* _changeInitializationLoading(false);

      yield* _navigationStream();

      final _cityList = await _cityService.getCityList();
      final _selectedCity = await _cityService.getSavedCity();
      final _selectedLanguage = await _languageService.getLanguage();

      if (_cityList != null) {
        yield SaveCityListAction(cityList: _cityList);
      }

      if (_selectedLanguage == null) {
        await DialogService.instance.show(
          ChooseLanguageDialog(
            selectLanguage: action.selectLanguageFunction,
          ),
        );
      } else {
        action.selectLanguageFunction(
          _selectedLanguage.languageCode,
        );
      }

      if (_selectedCity == null) {
        await DialogService.instance.show(
          ChooseCityDialog(
            locations: _cityList,
            selectCity: action.selectCityFunction,
          ),
        );
      } else {
        action.selectCityFunction(_selectedCity);
      }
    });
  }

  /// In the [_changeInitializationLoading] function, the page load status changes.
  /// Does it accept the [value] parameter, depending on which page is returned or not?
  static Stream<dynamic> _changeInitializationLoading(bool value) {
    if (value) {
      return Stream.value(StartLoadingAction(
        loader: DefaultLoaderDialog(
          state: true,
          loaderKey: LoaderKey.initializationLoading,
        ),
      ));
    }
    return Stream.value(StopLoadingAction(
      loaderKey: LoaderKey.initializationLoading,
    ));
  }

  /// The [_navigationStream] function performs the transition depending on what is passed in [id].
  static Stream<dynamic> _navigationStream() {
    return Stream.value(RouteSelectors.gotoHomePageAction);
  }
}
