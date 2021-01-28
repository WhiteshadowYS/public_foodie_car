import 'package:foodie_car_template/data/res/locales.dart';
import 'package:foodie_car_template/dictionary/data/ru.dart';
import 'package:flutter/material.dart';

import 'package:foodie_car_template/dictionary/models/supported_language.dart';

class SupportedLocales {
  List<SupportedLanguage> _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: Locales.ru,
        language: ru,
      )..choose(),
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.discard();
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == languageCode)?.choose();
  }

  List<Locale> get getSupportedLocales {
    return _supportedLocales?.map((SupportedLanguage supLang) => supLang.getLocale)?.toList() ?? <SupportedLanguage>[];
  }

  List<SupportedLanguage> get getSupportedLanguages {
    return _supportedLocales ?? <SupportedLanguage>[];
  }

  String get getCurrentLocale {
    return _supportedLocales?.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.languageCode ?? Locales.base;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }
}
