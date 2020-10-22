import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:my_catalog/store/shared/storage/storage_data_selector.dart';
import 'package:my_catalog/store/shared/storage/storage_language_selector.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class SettingsPageVM {
  final bool isPushNotificationsOn;
  final bool isNeedShowLanguages;
  final String selectedLocale;
  final String selectedLanguage;
  final InfoModel info;

  final void Function() back;
  final void Function() openLanguagesPopup;
  final void Function() navigateToTermsPage;
  final void Function() changePushNotificationStatus;
  final String Function(String) backButtonText;
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
