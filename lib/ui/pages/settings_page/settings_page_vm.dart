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
  final String selectedLanguage;
  final bool isPushNotificationsOn;
  final bool isNeedShowLanguages;

  final void Function() back;
  final void Function() openLanguagesPopup;
  final void Function() navigateToTermsPage;
  final void Function() changePushNotificationStatus;

  const SettingsPageVM({
    @required this.info,
    @required this.selectedLanguage,
    @required this.openLanguagesPopup,
    @required this.isPushNotificationsOn,
    @required this.isNeedShowLanguages,
    @required this.changePushNotificationStatus,
    @required this.navigateToTermsPage,
    @required this.back,
  });

  static SettingsPageVM fromStore(Store<AppState> store) {
    return SettingsPageVM(
      info: StorageSelector.getInfoModel(store),
      selectedLanguage: StorageSelector.getSelectedLanguage(store),
      // TODO(Yuri): Move to Selectors, https://appvesto.atlassian.net/secure/RapidBoard.jspa?rapidView=2&view=detail&selectedIssue=MC-35.
      openLanguagesPopup: () => DialogService.instance.show(LanguageDialog(
        // TODO(Yuri): Fix this pop-up for count of languages > 20.
        // TODO(Yuri): Max size of pop-up should be 2/3 of screen, after that - scrolling list, https://appvesto.atlassian.net/secure/RapidBoard.jspa?rapidView=2&view=detail&selectedIssue=MC-35.
        list: StorageSelector.getLanguages(store),
        selectedLanguage: StorageSelector.getSelectedLanguage(store),
        onItemSelected: StorageSelector.getUpdateLanguageFunction(store),
      )),
      isNeedShowLanguages: StorageSelector.isNeedShowLanguagesPopup(store),
      navigateToTermsPage: RouteSelectors.gotoTermsReadOnlyPage(store),
      back: RouteSelectors.doPop(store),
      // TODO(Oles): need to add logic
      isPushNotificationsOn: true,
      changePushNotificationStatus: () {},
    );
  }
}
