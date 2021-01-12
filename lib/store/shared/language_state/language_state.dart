import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:foodie_client_template/data/res/locales.dart';
import 'package:foodie_client_template/dictionary/flutter_dictionary.dart';
import 'package:foodie_client_template/store/shared/language_state/actions/change_language_action.dart';
import 'package:foodie_client_template/store/shared/reducer.dart';

class LanguageState {
  final String locale;
  LanguageState({
    @required this.locale,
  });

  factory LanguageState.initial() {
    return LanguageState(
      locale: Locales.base,
    );
  }

  LanguageState copyWith({String locale}) {
    return LanguageState(
      locale: locale ?? this.locale,
    );
  }

  LanguageState reducer(dynamic action) {
    return Reducer<LanguageState>(
      actions: HashMap.from({
        ChangeLanguageAction: (dynamic action) => _changeLanguageAction(action as ChangeLanguageAction),
      }),
    ).updateState(action, this);
  }

  LanguageState _changeLanguageAction(ChangeLanguageAction action) {
    FlutterDictionary.instance.setNewLanguageAndSave(action.locale);
    return copyWith(
      locale: action.locale,
    );
  }
}
