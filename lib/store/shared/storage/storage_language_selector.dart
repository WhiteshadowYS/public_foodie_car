import 'package:flutter/material.dart';
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
  static TextDirection selectedLocaleDirection(Store<AppState> store) {
    final List<LanguageModel> languages = store.state.storageState.storage?.settings?.languages;

    final int index = languages?.indexWhere((LanguageModel language) {
          return language.code.toLowerCase() == getSelectedLocale(store).toLowerCase();
        }) ??
        -1;

    if (index == null || index == -1) {
      return TextDirection.ltr;
    }

    final TextDirection direction = languages[index].direction.toLowerCase() == 'ltr' ? TextDirection.ltr : TextDirection.rtl;

    return direction;
  }

  static String getSelectedLocale(Store<AppState> store) {
    try {
      final List<SavedStorageModel> history = store.state.storageState?.storesHistory;

      final int index = history.indexWhere((element) {
        return element.id == store.state.storageState.openedStoreId;
      });

      if (index == null || index == -1) {
        return Locales.base;
      }

      final SavedStorageModel selectedModel = history[index];

      int _tmpIndex;

      if (selectedModel != null) {
        _tmpIndex = selectedModel.storage.settings.languages.indexWhere((lang) => lang.code == selectedModel.locale);

        if (_tmpIndex != -1) {
          return selectedModel.storage.settings.languages[_tmpIndex].code;
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
      final List<SavedStorageModel> history = store.state.storageState?.storesHistory;

      final int index = history.indexWhere((element) {
        return element.id == store.state.storageState.openedStoreId;
      });

      if (index == null || index == -1) {
        return Locales.base;
      }

      final SavedStorageModel selectedModel = history[index];
      int _tmpIndex;

      if (selectedModel != null) {
        _tmpIndex = selectedModel.storage.settings.languages.indexWhere((lang) => lang.code == selectedModel.locale);

        if (_tmpIndex != -1) {
          return selectedModel.storage.settings.languages[_tmpIndex].name;
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

  static String Function(String locale) getTermsButtonText(Store<AppState> store) {
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
      final List<SavedStorageModel> history = store.state.storageState.storesHistory;

      print('Old History languages: ${history.map((lng) => 'id: ${lng.id}, locale: ${lng.locale}').toList()}');

      final int index = history.indexWhere((element) {
        return element.id == store.state.storageState?.openedStoreId;
      });

      if (index == null || index == -1) {
        logger.e('<getUpdateLanguageFunction> storage was not found');
        return;
      }

      final SavedStorageModel storageModel = history[index];

      if (locale != storageModel.locale) {
        store.dispatch(
          UpdateLanguageAction(
            newModel: storageModel.copyWith(locale: locale),
          ),
        );
      }
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
