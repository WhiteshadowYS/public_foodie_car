import 'package:flutter/material.dart';
import 'package:foodie_car_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_car_template/dictionary/models/supported_locales.dart';
import 'package:foodie_car_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

abstract class LanguageSelector {
  static String getSelectedLanguageName(Store<AppState> store) {
    return SupportedLocales.instance.getSupportedLanguages
            .firstWhere(
              (element) {
                return element.languageCode == store.state.languageState.locale;
              },
              orElse: () => null,
            )
            ?.language
            ?.name ??
        '';
  }

  static String getCurrentLocale(Store<AppState> store) {
    return store.state.languageState.locale;
  }

  static TextDirection getCurrentTextDirection(Store<AppState> store) {
    if (FlutterDictionary.instance.isLocaleRTL(store.state.languageState.locale)) {
      return TextDirection.rtl;
    }

    return TextDirection.ltr;
  }
}
