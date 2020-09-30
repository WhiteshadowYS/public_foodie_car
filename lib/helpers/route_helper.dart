import 'package:flutter/material.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/res/routes.dart';

import 'package:my_catalog/ui/pages/home_page/home_page.dart';
import 'package:my_catalog/ui/pages/next_button_page/next_button_page.dart';
import 'package:my_catalog/ui/pages/splash_screen/splash_screen.dart';
import 'package:my_catalog/ui/pages/unknown_page/unknown_page.dart';
import 'package:my_catalog/ui/pages/settings_page/settings_page.dart';

class RouteHelper {
  static const String tag = '[RouteHelper]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
        );

      case Routes.home:
        return _defaultRoute(
          settings: settings,
          page: HomePage(),
        );

      case Routes.nextButton:
        return _defaultRoute(
          settings: settings,
          page: NextButtonPage(),
        );

      case Routes.settings:
        return _defaultRoute(
          settings: settings,
          page: SettingsPage(),
        );

      default:
        logger.w('$tag => <onGenerateRoute> => invalid route!!! => ${settings.name}');
        return _defaultRoute(
          settings: settings,
          page: UnknownPage(),
        );
    }
  }

  static Route<dynamic> _defaultRoute({RouteSettings settings, Widget page}) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        return page;
      },
      transitionDuration: const Duration(),
    );
  }
}