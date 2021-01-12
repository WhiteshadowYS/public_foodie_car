import 'package:flutter/material.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/store/application/app_state.dart';
import 'package:redux/redux.dart';

abstract class LanguageSelector {
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
