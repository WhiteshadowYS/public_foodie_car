import 'package:flutter/material.dart';
import 'package:foodie_client_template/ui/layouts/main_layout/main_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showAppBar: false,
      showBottomBar: false,
      key: Key('[SplashScreen][MainLayout]'),
      child: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}
