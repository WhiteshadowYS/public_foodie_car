import 'package:flutter/material.dart';
import 'package:foodie_client_template/store/city_state/city_selector.dart';
import 'package:foodie_client_template/store/shared/dialog_state/dialog_selector.dart';
import 'package:foodie_client_template/store/shared/language_state/language_selector.dart';
import 'package:redux/redux.dart';
import 'package:foodie_client_template/store/application/app_state.dart';

class ProfilePageVM {
  final String selectedLanguageName;
  final String selectedCityName;

  final void Function() openLanguageDialog;
  final void Function() openCityDialog;

  const ProfilePageVM({
    @required this.selectedCityName,
    @required this.selectedLanguageName,
    @required this.openCityDialog,
    @required this.openLanguageDialog,
  });

  static ProfilePageVM init(Store<AppState> store) {
    return ProfilePageVM(
      openCityDialog: DialogSelectors.getShowCityDialogFunction(store),
      openLanguageDialog: DialogSelectors.getShowLanguageDialogFunction(store),
      selectedCityName: CitySelector.getSelectedCityName(store),
      selectedLanguageName: LanguageSelector.getSelectedLanguageName(store),
    );
  }
}
