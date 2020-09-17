import 'package:flutter/material.dart';

import 'package:pictures_view/res/const.dart';
import 'package:pictures_view/res/routes.dart';

import 'package:pictures_view/ui/pages/home_page/home_page.dart';
import 'package:pictures_view/ui/pages/unknown_page/unknown_page.dart';
import 'package:pictures_view/ui/pages/settings_page/settings_page.dart';

class RouteHelper {
  static const String tag = '[RouteHelper]';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _defaultRoute(
          settings: settings,
          page: HomePage(),
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

  static Route _defaultRoute({RouteSettings settings, Widget page}) {
    return PageRouteBuilder(
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