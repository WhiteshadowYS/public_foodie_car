import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/models/models/storage_model/settings/info_model.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/settings_page/settings_page_vm.dart';
import 'package:my_catalog/ui/shared/app_bar/main_app_bar.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: Key('SettingsPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsPageVM>(
      converter: SettingsPageVM.fromStore,
      builder: (BuildContext context, vm) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InfoBlock(
                key: 'SettingsPageInfoBlock',
                info: vm.info,
              ),
              RaisedButton(
                child: Text('To Terms Page'),
                onPressed: () => vm.navigateToTermsPage(),
              ),
            ],
          ),
        );
      }
    );
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
          Container(),
          Text(
            info.title,
            style: CustomTheme.textStyles.titleTextStyle(size: 14.0),
          ),
          Text(
            info.title,
            style: CustomTheme.textStyles.mainTextStyle(size: 14.0),
          ),
        ],
      ),
    );
  }
}

