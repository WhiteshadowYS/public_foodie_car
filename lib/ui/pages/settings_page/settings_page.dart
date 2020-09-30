import 'package:flutter/material.dart';
import 'package:my_catalog/ui/layouts/appbars/main_appbar.dart';

import 'package:my_catalog/ui/layouts/main_layout/main_layout.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: Key('SettingsPage'));

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBar: MainAppBar(title: 'Settings'.toUpperCase()),
      child: Center(
        child: Text(
          'Settings Page',
        ),
      ),
    );
  }
}
