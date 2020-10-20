import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/services/dialog_service/dialog_service.dart';
import 'package:my_catalog/services/dialog_service/models/language_dialog.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/global/storage/storage_selector.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

// TODO(Yuri): Add comments for this class.
class SettingsPageVM {
  final InfoModel info;
  final String selectedLocale;
  final String selectedLanguage;
  final bool isPushNotificationsOn;
  final bool isNeedShowLanguages;

  final void Function() back;
  final void Function() openLanguagesPopup;
  final void Function() navigateToTermsPage;
  final void Function() changePushNotificationStatus;
  final String Function(String) backButtonText;

  const SettingsPageVM({
    @required this.info,
    @required this.selectedLanguage,
    @required this.openLanguagesPopup,
    @required this.isPushNotificationsOn,
    @required this.isNeedShowLanguages,
    @required this.changePushNotificationStatus,
    @required this.navigateToTermsPage,
    @required this.back,
    @required this.selectedLocale,
    @required this.backButtonText,
  });

  static SettingsPageVM fromStore(Store<AppState> store) {
    return SettingsPageVM(
      selectedLocale: StorageSelector.getSelectedLocale(store),
      backButtonText: StorageSelector.getBackButtonText(store),
      info: StorageSelector.getInfoModel(store),
      selectedLanguage: StorageSelector.getSelectedLanguage(store),
      openLanguagesPopup: StorageSelector.getOpenLanguageDialogFunction(store),
      isNeedShowLanguages: StorageSelector.isNeedShowLanguagesPopup(store),
      navigateToTermsPage: RouteSelectors.gotoTermsReadOnlyPage(store),
      back: RouteSelectors.doPop(store),
      // TODO(Oles): need to add logic
      isPushNotificationsOn: true,
      changePushNotificationStatus: () {},
    );
  }
}
