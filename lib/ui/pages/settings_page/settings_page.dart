import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';
import 'package:my_catalog/ui/pages/settings_page/settings_page_vm.dart';
import 'package:my_catalog/ui/shared/bottom_bar/bottom_bar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: Key('SettingsPage'));
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SettingsPageVM>(
      converter: SettingsPageVM.fromStore,
      builder: (BuildContext context, vm) {
        return MainLayout(
          bottomBar: BottomBar(key: 'BottomBar',),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Settings Page'),
              const SizedBox(height: 24.0),
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
