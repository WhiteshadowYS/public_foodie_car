import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/models/models/storage_model/settings/language_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/store/shared/route_selectors.dart';
import 'package:redux/redux.dart';

class SettingsPageVM {
  final InfoModel info;
  final List<LanguageModel> languages;
  final bool isPushNotificationsOn;
  final String appVersion;
  final void Function() navigateToTermsPage;

  const SettingsPageVM({
    @required this.info,
    @required this.languages,
    @required this.isPushNotificationsOn,
    @required this.appVersion,
    @required this.navigateToTermsPage,
  });

  static SettingsPageVM fromStore(Store<AppState> store) {
    return SettingsPageVM(
      info: InfoModel(
        logoImage: 'https://upload.wikimedia.org/wikipedia/commons/1/11/Test-Logo.svg',
        title: 'Example title',
        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      ),
      languages: [
        LanguageModel(
          name: 'English',
          code: 'EN',
          flag: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Flag_of_the_United_States_%281795%E2%80%931818%29.svg/220px-Flag_of_the_United_States_%281795%E2%80%931818%29.svg.png',
          direction: 'LTR',
          isDefault: false,
        ),
        LanguageModel(
          name: 'עברית',
          code: 'HE',
          flag: 'https://www.pictorem.com/collection/900_1824069HighRes.jpg',
          direction: 'RTL',
          isDefault: true,
        ),
      ],
      isPushNotificationsOn: false,
      appVersion: 'App version 1.01.1',
      navigateToTermsPage: RouteSelectors.gotoTermsPage(store),
    );
  }
}