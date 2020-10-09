import 'package:my_catalog/dictionary/dictionary_classes/appbar_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/catalog_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/popup_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/setting_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';
import 'package:my_catalog/dictionary/models/language.dart';

const Language en = Language(
  termsPageDictionary: TermsPageDictionary(
    title: 'Terms and conditions',
    agree: 'I Agree',
  ),
  errorDictionary: ErrorDictionary(
    isNumberError: 'Please enter number',
  ),
  mainPageDictionary: MainPageDictionary(
    enterCatalogId: 'Please enter a Catalog ID',
    viewCatalog: 'View Catalog',
    name: 'Name',
    iWantToCreate: 'I want to create my own Catalog',
    errorID: 'This ID is incorrect',
  ),
  appbarDictionary: AppbarDictionary(
    back: 'Back',
  ),
  settingPageDictionary: SettingPageDictionary(
    appVersion: 'App version 1.01.1',
    createBy: 'Created by AppVesto',
    settings: 'Settings',
    language: 'Language',
    terms: 'Terms and conditions',
    pushNotification: 'Push notifications',
  ),
  catalogPageDictionary: CatalogPageDictionary(
    chooseCatalog: 'Choose another catalog',
    chooseStore: 'Choose another store',
  ),
  popUpDictionary: PopUpDictionary(
    gotIt: 'Got it!',
    loading: 'Loading...',
  ),
);
