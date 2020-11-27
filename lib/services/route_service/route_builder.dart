import 'dart:io';

import 'package:base_project_template/models/pages/models/id_page_data.dart';
import 'package:base_project_template/ui/pages/id_page/id_page.dart';
import 'package:flutter/cupertino.dart';
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

      case Routes.idPage:
        return _defaultRoute(
          settings: settings,
          page: IdPage(
            idPageData: settings.arguments ?? IdPageData(
              id: 'IdPage',
              pageNumber: 0,
            ),
          ),
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
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return page;
        },
      );
    }

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
