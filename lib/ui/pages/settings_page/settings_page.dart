import 'package:flutter/material.dart';

import 'package:pictures_view/ui/layouts/main_layout/main_layout.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: Key('SettingsPage'));

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Center(
        child: Text(
          'Settings Page',
        ),
      ),
    );
  }
}
