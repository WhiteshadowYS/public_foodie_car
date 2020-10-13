import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_version/get_version.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/settings_page/settings_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';
import 'package:my_catalog/ui/shared/svg_images.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage() : super(key: Key('SettingsPage'));

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String appVersion = '';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsPageVM>(
      converter: SettingsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        _updateAppVersion();

        return MainLayout(
          appBar: MainAppBar(
            title: 'Settings',
            backOnTap: () {},
          ),
          bottomBar: BottomBar(
            key: 'BottomBar',
          ),
          bgColor: CustomTheme.colors.background,
          child: Column(
            children: [
              InfoBlock(
                key: 'SettingsPageInfoBlock',
                info: vm.info,
              ),
              SettingsItem(
                key: 'SettingsItemPushNotifications',
                text: 'Push notifications',
                child: Switch(
                  value: true,
                  onChanged: (bool val) {},
                ),
              ),
              SettingsItem(
                key: 'SettingsItemLanguage',
                text: 'Language',
                child: Container(),
              ),
              SettingsItem(
                key: 'SettingsItemTAC',
                text: 'Terms and Conditions',
                child: Icon(Icons.arrow_forward_ios),
              ),
              Spacer(),
              Text(
                'App version $appVersion',
                style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
              ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                'Created by AppVesto',
                style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
              ),
              SizedBox(
                height: 46.0,
              ),
            ],
          ),
        );
      }
    );
  }

  Future<void> _updateAppVersion() async {
    String versionName;
    String versionCode;
    String versionPlatform;

    try {
      versionName = await GetVersion.projectVersion;
      // logger.d('Version Name: $versionName');
    } on PlatformException {
      versionName = null;
    }

    try {
      versionCode = await GetVersion.projectCode;
      // logger.d('Version Code: $versionCode');
    } on PlatformException {
      versionCode = null;
    }

    try {
      versionPlatform = await GetVersion.platformVersion;
      // logger.d('Version Platform: $versionPlatform');
    } on PlatformException {
      versionPlatform = null;
    }

    setState(() {
      appVersion = '$versionName ($versionCode)';
    });
  }
}

class InfoBlock extends StatelessWidget {
  final InfoModel info;

  InfoBlock({
    @required String key,
    @required this.info,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
            width: 35.0,
            height: 35.0,
            child: info.logoImage != null && info.logoImage != ''
              ? SvgPicture.network(info.logoImage)
              : SVGImages().mcLogo(),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            info.title,
            style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
          ),
          SizedBox(
            height: 14.0,
          ),
          Text(
            info.text,
            style: CustomTheme.textStyles.mainTextStyle(size: 14.0),
          ),
          SizedBox(
            height: 38.0,
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String text;
  final Widget child;

  SettingsItem({
    @required String key,
    @required this.text,
    @required this.child,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 16.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: child,
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            width: double.infinity,
            color: CustomTheme.colors.font.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}


