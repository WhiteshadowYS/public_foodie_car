import 'package:flutter/material.dart';

import 'package:base_project_template/res/const.dart';
import 'package:base_project_template/services/route_service/models/routes.dart';
import 'package:base_project_template/ui/pages/main_page/main_page.dart';
import 'package:base_project_template/ui/shared/splash_screen/splash_screen.dart';
import 'package:base_project_template/ui/shared/unknown_page/unknown_page.dart';

class RouteBuilder {
  static const String tag = '[RouteBuilder]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
        );

      case Routes.main:
        return _defaultRoute(
          settings: settings,
          page: MainPage(),
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
