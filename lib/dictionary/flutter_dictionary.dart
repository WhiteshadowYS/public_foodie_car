import 'package:foodie_client_template/data/res/locales.dart';
import 'package:flutter/material.dart';

import 'package:foodie_client_template/dictionary/models/language.dart';
import 'package:foodie_client_template/dictionary/flutter_delegate.dart';

class FlutterDictionary {
  static const String tag = '[FlutterDictionary]';

  FlutterDictionary._privateConstructor({String localeCode = Locales.base}) {
    localeNotifier.value = Locale(localeCode);
  }

  FlutterDictionary({String localeCode = Locales.base}) {
    localeNotifier.value = Locale(localeCode);
  }

  static final FlutterDictionary _instance = FlutterDictionary._privateConstructor();

  static FlutterDictionary get instance => _instance;

  final ValueNotifier localeNotifier = ValueNotifier<Locale>(Locale(Locales.base));
  Language language;

  void setNewLanguage(String languageCode) {
    print('$tag => setNewLanguage() => locale => $languageCode');
    // FlutterDictionaryDelegate.changeLocaleWithLanguageCode(languageCode);
    localeNotifier.value = Locale(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
    print(localeNotifier.value);
  }

  void setNewLanguageAndSave(String languageCode) {
    print('$tag => setNewLanguageAndSave() => locale => $languageCode');
    localeNotifier.value = Locale(languageCode);
    language = FlutterDictionaryDelegate.getLanguageByLanguageCode(languageCode);
  }

  static const List<String> _rtlLanguages = <String>[];

  bool get isRTL {
    return _rtlLanguages.contains(FlutterDictionaryDelegate.getCurrentLocale);
  }
}
