import 'package:flutter/material.dart';

import 'package:pictures_view/res/const.dart';

import 'package:pictures_view/dictionary/models/language.dart';
import 'package:pictures_view/dictionary/flutter_delegate.dart';

class FlutterDictionary {
  static const String TAG = '[FlutterDictionary]';

  final Locale locale;
  Language language;

  static FlutterDictionary instance;

  FlutterDictionary(this.locale) {
    if (locale != null) setNewLanguage(locale.languageCode);
  }

  void setNewLanguage(String languageCode) {
    logger.i('$TAG => setNewLanguage() => locale => $languageCode');
    FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  void setNewLanguageAndSave(String languageCode) {
    logger.i('$TAG => setNewLanguageAndSave() => locale => $languageCode');
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  static FlutterDictionary of(BuildContext context) {
    return Localizations.of<FlutterDictionary>(context, FlutterDictionary);
  }

  static void init(BuildContext context) => instance = FlutterDictionary.of(context);

  static const List<String> _rtlLanguages = <String>[
    LOCALE_HE,
    LOCALE_PS,
    LOCALE_UR,
    LOCALE_AR,
    LOCALE_FA,
  ];

  bool get isRTL {
    return _rtlLanguages.contains(FlutterDictionaryDelegate.getCurrentLocale);
  }
}