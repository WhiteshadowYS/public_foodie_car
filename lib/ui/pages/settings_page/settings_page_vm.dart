import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SettingsPageVM {
  final InfoModel info;
  final String selectedLanguage;
  final bool isPushNotificationsOn;

  final void Function() back;
  final void Function() openLanguagesPopup;
  final void Function() navigateToTermsPage;
  final void Function() changePushNotificationStatus;

  const SettingsPageVM({
    @required this.info,
    @required this.selectedLanguage,
    @required this.openLanguagesPopup,
    @required this.isPushNotificationsOn,
    @required this.changePushNotificationStatus,
    @required this.navigateToTermsPage,
    @required this.back,
  });

  static SettingsPageVM fromStore(Store<AppState> store) {
    return SettingsPageVM(
      info: InfoModel(
        logoImage: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Test-Logo.svg',
        title: 'Example title',
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      ),
      selectedLanguage: 'English',
      openLanguagesPopup: () {},
      isPushNotificationsOn: false,
      changePushNotificationStatus: () {},
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
      back: RouteSelectors.doPop(store),
    );
  }
}
