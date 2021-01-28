import 'package:foodie_car_template/domain/functional_services/dialog_service/dialog_service.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/choose_city_dialog.dart';
import 'package:foodie_car_template/domain/functional_services/dialog_service/models/choose_language_dialog.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:foodie_car_template/store/city_state/actions/save_city_action.dart';
import 'package:foodie_car_template/store/shared/dialog_state/actions/force_close_dialog_action.dart';
import 'package:foodie_car_template/store/shared/language_state/actions/change_language_action.dart';
import 'package:redux/redux.dart';

/// [DialogSelectors] it class with static functions for work with Dialogs from Pages.
/// Functions:
///   - [isDialogDisplayed]. This function was get the current dialog status.
///   - [getCloseDialogFunction]. This function was get function for close any dialogs.
///   - [getShowErrorDialogFunction]. This function is getting function for showing error dialog.
///   - [getInternetConnectionDialogFunction]. This function is getting function for showing lost internet connection dialog.
///   - [getExitDialogFunction]. This function is getting function for showing exit dialog.
class DialogSelectors {
  static void Function() getShowLanguageDialogFunction(Store<AppState> store) {
    return () async {
      await DialogService.instance.show(
        ChooseLanguageDialog(
          selectLanguage: (locale) => store.dispatch(
            ChangeLanguageAction(locale: locale),
          ),
        ),
      );
    };
  }

  static void Function() getShowCityDialogFunction(Store<AppState> store) {
    return () async {
      await DialogService.instance.show(
        ChooseCityDialog(
          locations: store.state.cityState?.cityList ?? [],
          selectCity: (city) => store.dispatch(
            SaveCityAction(city: city),
          ),
        ),
      );
    };
  }

  static bool isDialogDisplayed(Store<AppState> store) {
    return store.state.dialogState.isDialogDisplayed;
  }

  static void Function() getCloseDialogFunction(Store<AppState> store) {
    return () {
      store.dispatch(ForceCloseDialogAction());
    };
  }
}
