import 'package:flutter/foundation.dart';
import 'package:my_catalog/dictionary/dictionary_classes/appbar_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/catalog_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/popup_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/server_texts_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/setting_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';

class Language {
  final ServerTextsDictionary serverTextsDictionary;
  final TermsPageDictionary termsPageDictionary;
  final MainPageDictionary mainPageDictionary;
  final AppbarDictionary appbarDictionary;
  final SettingPageDictionary settingPageDictionary;
  final CatalogPageDictionary catalogPageDictionary;
  final PopUpDictionary popUpDictionary;
  final ErrorDictionary errorDictionary;

  const Language({
    @required this.serverTextsDictionary,
    @required this.termsPageDictionary,
    @required this.mainPageDictionary,
    @required this.appbarDictionary,
    @required this.settingPageDictionary,
    @required this.catalogPageDictionary,
    @required this.popUpDictionary,
    @required this.errorDictionary,
  });
}
