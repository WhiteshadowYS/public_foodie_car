import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_version/get_version.dart';
import 'package:my_catalog/dictionary/dictionary_classes/setting_page_dictionary.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/settings_page/settings_page_vm.dart';
import 'package:my_catalog/ui/pages/settings_page/widgets/custom_switch.dart';
import 'package:my_catalog/ui/pages/settings_page/widgets/info_block.dart';
import 'package:my_catalog/ui/pages/settings_page/widgets/language_dropdown.dart';
import 'package:my_catalog/ui/pages/settings_page/widgets/settings_item.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() : super(key: Key('SettingsPage'));

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String appVersion = '';

  @override
  void initState() {
    _updateAppVersion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final SettingPageDictionary dictionary = FlutterDictionary.instance.language.settingPageDictionary;

    return StoreConnector<AppState, SettingsPageVM>(
      // TODO(Yuri): Move all Keys to file with consts(res/keys.dart).
      converter: SettingsPageVM.fromStore,
      builder: (BuildContext context, SettingsPageVM vm) {
        return MainLayout(
          back: vm.back,
          appBar: MainAppBar(
            key: 'SettingsPageMainAppBar',
            title: dictionary.settings,
            backOnTap: vm.back,
          ),
          bottomBar: BottomBar(
            key: 'SettingsPageBottomBar',
          ),
          bgColor: CustomTheme.colors.background,
          child: ListView(
            children: [
              InfoBlock(
                key: 'SettingsPageInfoBlock',
                info: vm.info,
              ),
              SettingsItem(
                key: 'SettingsItemPushNotifications',
                text: dictionary.pushNotification,
                child: CustomSwitch(
                  key: 'SettingsItemPushNotificationsCustomSwitch',
                  value: vm.isPushNotificationsOn,
                  activeColor: CustomTheme.colors.primaryColor,
                  inactiveColor: CustomTheme.colors.accentColor,
                  circleColor: CustomTheme.colors.background,
                ),
                callback: vm.changePushNotificationStatus,
              ),
              if (vm.isNeedShowLanguages)
                SettingsItem(
                  key: 'SettingsItemLanguage',
                  text: dictionary.language,
                  child: LanguageDropdown(
                    key: 'SettingsItemLanguageLanguageDropdown',
                    text: vm.selectedLanguage,
                  ),
                  callback: vm.openLanguagesPopup,
                ),
              SettingsItem(
                key: 'SettingsItemTAC',
                text: dictionary.terms,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 18,
                  color: CustomTheme.colors.minorFont,
                ),
                callback: vm.navigateToTermsPage,
              ),
              SizedBox(
                height: 64.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Align(
                  child: Text(
                    '${dictionary.appVersion} $appVersion',
                    style: CustomTheme.textStyles.titleTextStyle(size: 14.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Align(
                  child: Text(
                    dictionary.createBy,
                    style: CustomTheme.textStyles.titleTextStyle(size: 14.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 46.0,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updateAppVersion() async {
    if (appVersion != '') return;

    String versionName;
    String versionCode;

    try {
      versionName = await GetVersion.projectVersion;
    } on PlatformException {
      versionName = null;
    }

    try {
      versionCode = await GetVersion.projectCode;
    } on PlatformException {
      versionCode = null;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => appVersion = '$versionName ($versionCode)');
    });
  }
}
