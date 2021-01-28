import 'package:foodie_car_template/store/shared/language_state/language_selector.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:foodie_car_template/store/application/app_state.dart';

class ApplicationVM {
  final String locale;
  ApplicationVM({
    @required this.locale,
  });

  static ApplicationVM init(Store<AppState> store) {
    return ApplicationVM(
      locale: LanguageSelector.getCurrentLocale(store),
    );
  }
}
