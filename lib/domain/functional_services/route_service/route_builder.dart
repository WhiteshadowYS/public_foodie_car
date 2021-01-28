import 'package:foodie_car_template/domain/functional_services/route_service/models/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_car_template/ui/pages/home_page/home_page.dart';
import 'package:foodie_car_template/ui/pages/login_page/login_page.dart';
import 'package:foodie_car_template/ui/widgets/splash_screen.dart';
import 'package:foodie_car_template/ui/widgets/unknown_page.dart';

class RouteBuilder {
  static const String tag = '[RouteBuilder]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash_screen:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
        );

      case Routes.home_page:
        return _defaultRoute(
          settings: settings,
          page: HomePage(),
        );

      case Routes.login_page:
        return _defaultRoute(
          settings: settings,
          page: LoginPage(),
        );

      default:
        print('$tag => <onGenerateRoute> => invalid route!!! => ${settings.name}');
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
