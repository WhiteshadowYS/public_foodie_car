import 'package:my_catalog/dictionary/dictionary_classes/appbar_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/catalog_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/main_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/popup_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/server_texts_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/setting_page_dictionary.dart';
import 'package:my_catalog/dictionary/dictionary_classes/terms_page_dictionary.dart';
import 'package:my_catalog/dictionary/models/language.dart';

const Language en = Language(
  serverTextsDictionary: ServerTextsDictionary(
    errorTitleText: 'Error',
    acceptButtonText: 'Got It!',
    shareButtonText: 'Share Via',
    descriptionText: 'Description',
    logoutButtonText: 'Log out',
    backButtonText: 'Back',
    termsPageTitle: 'Terms and Conditions',
    termsPageAgreeButton: 'I Agree!',
    productsPageTitle: 'Products',
    categoriesPageTitle: 'Categories',
    subcategoriesPageTitle: 'Subcategories',
    settingsPageTitle: 'Settings',
  ),
  termsPageDictionary: TermsPageDictionary(
    title: 'Terms and conditions',
    agree: 'I Agree',
  ),
  errorDictionary: ErrorDictionary(
    isNumberError: 'Please enter number',
    isNegativeNumIdError: 'Id cannot be negative',
    isZeroNumIdError: 'Id can\'t equal 0',
  ),
  mainPageDictionary: MainPageDictionary(
    history: 'History',
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
    appVersion: 'App version',
    createBy: 'Created by AppVesto',
    settings: 'Settings',
    language: 'Language',
    terms: 'Terms and conditions',
    pushNotification: 'Push notifications',
  ),
  catalogPageDictionary: CatalogPageDictionary(
    logOutText: 'Log out',
    chooseCatalog: 'Choose another catalog',
    chooseStore: 'Choose another store',
  ),
  popUpDictionary: PopUpDictionary(
    gotIt: 'Got it!',
    noInternet: 'No internet connection!',
    okay: 'Okay',
    loading: 'Loading...',
    exitText: 'Do you want to exit the application?',
    yes: 'Yes',
    no: 'No',
  ),
);
