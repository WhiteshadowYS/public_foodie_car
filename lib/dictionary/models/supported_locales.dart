import 'package:flutter/material.dart';

import 'package:my_catalog/res/const.dart';

import 'package:my_catalog/dictionary/data/en.dart';
import 'package:my_catalog/dictionary/models/supported_language.dart';

class SupportedLocales {
  List<SupportedLanguage> _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: LOCALE_EN,
        language: en,
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

  String get getCurrentLocale {
    return _supportedLocales?.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.languageCode ?? BASE_LOCALE;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }

}