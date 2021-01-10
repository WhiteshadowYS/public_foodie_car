import 'package:foody_client_template/data/res/locales.dart';
import 'package:flutter/material.dart';

import 'package:foody_client_template/dictionary/models/language.dart';
import 'package:foody_client_template/dictionary/flutter_delegate.dart';
import 'package:foody_client_template/dictionary/models/supported_locales.dart';

class FlutterDictionary {
  static const String tag = '[FlutterDictionary]';

  FlutterDictionary._privateConstructor({this.locale});

  static final FlutterDictionary _instance = FlutterDictionary._privateConstructor();

  static FlutterDictionary get instance => _instance;

  Locale locale;
  Language language;

  FlutterDictionary(this.locale) {
    setNewLanguage(SupportedLocales.instance.getCurrentLocale);
  }

  void setNewLanguage(String languageCode) {
    print('$tag => setNewLanguage() => locale => $languageCode');
    FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  void setNewLanguageAndSave(String languageCode) {
    print('$tag => setNewLanguageAndSave() => locale => $languageCode');
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  static const List<String> _rtlLanguages = <String>[];

  bool get isRTL {
    return _rtlLanguages.contains(FlutterDictionaryDelegate.getCurrentLocale);
  }
}
