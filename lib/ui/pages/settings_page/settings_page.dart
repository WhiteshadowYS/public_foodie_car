import 'package:flutter/cupertino.dart';
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
            key: 'SettingsPageMainAppBar',
            title: 'Settings',
            backOnTap: () {}, // TODO(Oles): get function from vm
          ),
          bottomBar: BottomBar(
            key: 'SettingsPageBottomBar',
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
                text: 'Push notifications', // TODO(Oles): remove to dictionary
                child: CustomSwitch(
                  key: 'SettingsItemPushNotificationsCustomSwitch',
                  value: true, // TODO(Oles): get value from vm
                  activeColor: CustomTheme.colors.primaryColor,
                  inactiveColor: CustomTheme.colors.accentColor,
                  circleColor: CustomTheme.colors.background,
                  callBack: (bool value) {}, // TODO(Oles): get function from vm
                ),
              ),
              SettingsItem(
                key: 'SettingsItemLanguage',
                text: 'Language', // TODO(Oles): remove to dictionary
                child: LanguageDropdown(
                  key: 'SettingsItemLanguageLanguageDropdown',
                  text: 'English', // TODO(Oles): get language from vm
                  callback: () {}, // TODO(Oles): get function from vm
                ),
              ),
              SettingsItem(
                key: 'SettingsItemTAC',
                text: 'Terms and Conditions', // TODO(Oles): remove to dictionary
                child: Icon(
                  Icons.keyboard_arrow_right, // TODO(Oles): set icon from design
                  size: 18,
                  color: CustomTheme.colors.minorFont,
                ),
              ),
              Spacer(),
              Text(
                'App version $appVersion', // TODO(Oles): remove to dictionary
                style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
              ),
              SizedBox(
                height: 14.0,
              ),
              Text(
                'Created by AppVesto', // TODO(Oles): remove to dictionary
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

  // TODO(Oles): remove function to utils
  Future<void> _updateAppVersion() async {
    String versionName;
    String versionCode;

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

    setState(() {
      appVersion = '$versionName ($versionCode)';
    });
  }
}

// TODO(Oles): remove to widgets
class LanguageDropdown extends StatelessWidget {
  final void Function() callback;
  final String text;

  LanguageDropdown({
    @required String key,
    @required this.text,
    @required this.callback,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108.0,
      height: 24.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: CustomTheme.textStyles.mainTextStyle(size: 15.0),
              ),
              Icon(
                Icons.keyboard_arrow_down,  // TODO(Oles): add arrow from design
                size: 18,
                color: CustomTheme.colors.minorFont,
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: CustomTheme.colors.minorFont,
          ),
        ],
      ),
    );
  }
}


// TODO(Oles): remove to widgets
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

// TODO(Oles): remove to widgets
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

// TODO(Oles): remove to widgets
class CustomSwitch extends StatefulWidget {
  bool value;
  final void Function(bool) callBack;
  final Color activeColor;
  final Color inactiveColor;
  final Color circleColor;

  CustomSwitch({
    @required String key,
    @required this.value,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.circleColor,
    @required this.callBack,
  }) : super(key: Key(key));

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          if (widget.value != null) widget.callBack(widget.value);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        height: 29.0,
        width: 56.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.0,
            color: widget.value
                ? widget.activeColor
                : widget.inactiveColor,
          ),
          borderRadius: BorderRadius.circular(50.0),
          color: widget.value
              ? widget.activeColor
              : widget.inactiveColor,
        ),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: !widget.value
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 22.0,
                width: 22.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.0),
                  color: widget.circleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
