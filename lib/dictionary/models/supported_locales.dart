import 'package:flutter/material.dart';

import 'package:pictures_view/res/const.dart';

import 'package:pictures_view/dictionary/data/en.dart';
import 'package:pictures_view/dictionary/models/supported_language.dart';

class SupportedLocales {
  List<SupportedLanguage> _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = [
      SupportedLanguage(
        languageCode: LOCALE_EN,
        language: en,
      )..choose(),
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales.firstWhere((supLang) => supLang.isSelected)?.discard();
    _supportedLocales.firstWhere((supLang) => supLang.languageCode == languageCode)?.choose();
  }

  List<Locale> get getSupportedLocales {
    return _supportedLocales?.map((supLang) => supLang.getLocale)?.toList() ?? [];
  }

  String get getCurrentLocale {
    return _supportedLocales?.firstWhere((supLang) => supLang.isSelected)?.languageCode ?? BASE_LOCALE;
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales.firstWhere((supLang) => supLang.languageCode == locale.languageCode);
  }

}