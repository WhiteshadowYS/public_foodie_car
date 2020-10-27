import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/models/models/saved_storage_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/locales.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/language_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/storage/actions/update_is_first_open_action.dart';
import 'package:my_catalog/store/shared/storage/actions/update_language_actions/update_language_action.dart';
import 'package:redux/redux.dart';

abstract class StorageLanguageSelector {
  static String getSelectedLocale(Store<AppState> store) {
    try {
      final SavedStorageModel lastModel = store.state.storageState?.storesHistory?.last;
      int _tmpIndex;

      if (lastModel != null) {
        _tmpIndex = lastModel.storage.settings.languages.indexWhere((lang) => lang.code == lastModel.locale);

        if (_tmpIndex != -1) {
          return lastModel.storage.settings.languages[_tmpIndex].code;
        }
      }

      _tmpIndex = store.state.storageState.storage.settings.languages.indexWhere((lang) => lang.isDefault == true);

      if (_tmpIndex != -1) {
        return store.state.storageState.storage.settings.languages[_tmpIndex].code;
      }

      return store.state.storageState.storage.settings.languages.first.code ?? Locales.base.toUpperCase();
    } catch (e) {
      return Locales.base.toUpperCase();
    }
  }

  static String getSelectedLanguage(Store<AppState> store) {
    try {
      final SavedStorageModel lastModel = store.state.storageState?.storesHistory?.last;
      int _tmpIndex;

      if (lastModel != null) {
        _tmpIndex = lastModel.storage.settings.languages.indexWhere((lang) => lang.code == lastModel.locale);

        if (_tmpIndex != -1) {
          return lastModel.storage.settings.languages[_tmpIndex].name;
        }
      }

      _tmpIndex = store.state.storageState.storage.settings.languages.indexWhere((lang) => lang.isDefault == true);

      if (_tmpIndex != -1) {
        return store.state.storageState.storage.settings.languages[_tmpIndex].name;
      }

      return store.state.storageState.storage.settings.languages.first.name;
    } catch (e) {
      return 'Error';
    }
  }

  static List<LanguageModel> getLanguages(Store<AppState> store) {
    return store.state.storageState.storage.settings.languages;
  }

  static bool getIsLanguagePopupNeeded(Store<AppState> store) {
    return store.state.storageState.isFirstOpen && store.state.storageState.storage.settings.languages.length > 1;
  }

  static bool isNeedShowLanguagesPopup(Store<AppState> store) {
    return store.state.storageState.storage.settings.languages.length > 1;
  }

  static String Function(String locale) getGoToCatalogButtonText(Store<AppState> store) {
    return (String locale) {
      final String termsButtonText = FlutterDictionary.instance.language.serverTextsDictionary.goToCatalog;

      if (locale == null || locale == '') {
        return termsButtonText;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.termsButtonText[locale];
        if (newValue == null) return termsButtonText;

        return newValue;
      } catch (e) {
        return termsButtonText;
      }
    };
  }

  static String Function(String locale) getTermsTitleText(Store<AppState> store) {
    return (String locale) {
      final String termsTitle = FlutterDictionary.instance.language.serverTextsDictionary.termsPageTitle;

      if (locale == null || locale == '') {
        return termsTitle;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.termsTitle[locale];
        if (newValue == null) return termsTitle;

        return newValue;
      } catch (e) {
        return termsTitle;
      }
    };
  }

  static String Function(String locale) getTermsSubTitleText(Store<AppState> store) {
    return (String locale) {
      final String termsSubTitle = EMPTY_STRING;

      if (locale == null || locale == '') {
        return termsSubTitle;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.termsSubTitle[locale];
        if (newValue == null) return termsSubTitle;

        return newValue;
      } catch (e) {
        return termsSubTitle;
      }
    };
  }

  static String Function(String locale) getTerms2SubTitleText(Store<AppState> store) {
    return (String locale) {
      final String terms2SubTitle = EMPTY_STRING;

      if (locale == null || locale == '') {
        return terms2SubTitle;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.terms2SubTitle[locale];
        if (newValue == null) return terms2SubTitle;

        return newValue;
      } catch (e) {
        return terms2SubTitle;
      }
    };
  }

  static String Function(String locale) getTermsAcceptButtonText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.termsPageAgreeButton;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.termsAcceptButton[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getAcceptButtonText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.acceptButtonText;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.acceptText[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getErrorTitleText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.errorTitleText;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.errorText[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getShareText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.shareButtonText;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.shareText[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getDescriptionText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.descriptionText;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.descriptionText[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getLogoutText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.logoutButtonText;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.logoutText[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getBackButtonText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.backButtonText;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.backButtonText[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getProductsTitleText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.productsPageTitle;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.productsTitle[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getCategoriesTitleText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.categoriesPageTitle;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.categoriesTitle[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static String Function(String locale) getSettingsPageTitleText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.settingsPageTitle;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.settingsTitle[locale];

        if (newValue == null) return value;

        return newValue;
      } catch (_) {
        return value;
      }
    };
  }

  static String Function(String locale) getSubcategoriesTitleText(Store<AppState> store) {
    return (String locale) {
      final String value = FlutterDictionary.instance.language.serverTextsDictionary.subcategoriesPageTitle;

      if (locale == null || locale == '') {
        return value;
      }

      try {
        final String newValue = store.state?.storageState?.storage?.settings?.languageData?.subcategoriesTitle[locale];
        if (newValue == null) return value;

        return newValue;
      } catch (e) {
        return value;
      }
    };
  }

  static void Function(String) getUpdateLanguageFunction(Store<AppState> store) {
    return (String locale) {
      store.dispatch(
        UpdateLanguageAction(
          newModel: store.state.storageState.storesHistory.last.copyWith(locale: locale),
        ),
      );
      store.dispatch(
        UpdateIsFirstOpenAction(
          isFirstOpen: false,
        ),
      );
    };
  }

  static void Function() getOpenLanguageDialogFunction(Store<AppState> store) {
    return () {
      DialogService.instance.show(
        LanguageDialog(
          list: StorageLanguageSelector.getLanguages(store),
          selectedLanguage: StorageLanguageSelector.getSelectedLanguage(store),
          onItemSelected: getUpdateLanguageFunction(store),
        ),
      );
    };
  }
}
