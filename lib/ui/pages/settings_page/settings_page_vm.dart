import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

class SettingsPageVM {
  /// Variable [isPushNotificationsOn] using to check is push notifications enabled
  final bool isPushNotificationsOn;

  /// Variable [isNeedShowLanguages] using to check is need to show select language popup
  /// If needed calls [openLanguagesPopup] method
  final bool isNeedShowLanguages;

  /// Variable [selectedLocale] show current locale
  final String selectedLocale;

  /// Variable [selectedLanguage] show current language
  final String selectedLanguage;

  /// Variable [info] contains information about current company.
  final InfoModel info;

  /// Method [back] used to return back from settings page
  final void Function() back;

  /// Method [openLanguagesPopup] used to open language popup
  final void Function() openLanguagesPopup;

  /// Method [navigateToTermsPage] used to navigates to Terms page
  final void Function() navigateToTermsPage;

  /// Method [changePushNotificationStatus] used to enable or disable
  /// push notifications
  final void Function() changePushNotificationStatus;

  /// Method [backButtonText] return text that respond to [currentLocale]
  final String Function(String) backButtonText;

  /// Method [settingsPageTitle] return text that respond to [currentLocale]
  final String Function(String) settingsPageTitle;

  const SettingsPageVM({
    @required this.info,
    @required this.back,
    @required this.backButtonText,
    @required this.selectedLocale,
    @required this.selectedLanguage,
    @required this.settingsPageTitle,
    @required this.openLanguagesPopup,
    @required this.isNeedShowLanguages,
    @required this.navigateToTermsPage,
    @required this.isPushNotificationsOn,
    @required this.changePushNotificationStatus,
  });

  static SettingsPageVM fromStore(Store<AppState> store) {
    return SettingsPageVM(
      /// StorageDataSelector
      info: StorageDataSelector.getInfoModel(store),

      /// StorageLanguageSelector
      selectedLocale: StorageLanguageSelector.getSelectedLocale(store),
      backButtonText: StorageLanguageSelector.getBackButtonText(store),
      selectedLanguage: StorageLanguageSelector.getSelectedLanguage(store),
      settingsPageTitle: StorageLanguageSelector.getSettingsPageTitleText(store),
      isNeedShowLanguages: StorageLanguageSelector.isNeedShowLanguagesPopup(store),
      openLanguagesPopup: StorageLanguageSelector.getOpenLanguageDialogFunction(store),

      /// Another
      back: RouteSelectors.doPop(store),
      navigateToTermsPage: RouteSelectors.gotoTermsReadOnlyPage(store),
      // TODO(Oles): need to add logic
      isPushNotificationsOn: true,
      changePushNotificationStatus: () {},
    );
  }
}
