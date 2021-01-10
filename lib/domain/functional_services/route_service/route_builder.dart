import 'package:foody_client_template/domain/functional_services/route_service/models/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foody_client_template/ui/pages/about_page/about_page.dart';
import 'package:foody_client_template/ui/pages/categories_page/categories_page.dart';
import 'package:foody_client_template/ui/pages/gallery_page/gallery_page.dart';
import 'package:foody_client_template/ui/pages/home_page/home_page.dart';
import 'package:foody_client_template/ui/pages/subcategories_page/subcategories_page.dart';
import 'package:foody_client_template/ui/widgets/splash_screen.dart';
import 'package:foody_client_template/ui/widgets/unknown_page.dart';

class RouteBuilder {
  static const String tag = '[RouteBuilder]';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home_page:
        return _defaultRoute(
          settings: settings,
          page: HomePage(),
        );
      case Routes.about_page:
        return _defaultRoute(
          settings: settings,
          page: AboutPage(),
        );
      case Routes.categories_page:
        return _defaultRoute(
          settings: settings,
          page: CategoriesPage(),
        );
      case Routes.subcategories_page:
        return _defaultRoute(
          settings: settings,
          page: SubcategoriesPage(),
        );
      case Routes.gallery_page:
        return _defaultRoute(
          settings: settings,
          page: GalleryPage(),
        );
      case Routes.splash_screen:
        return _defaultRoute(
          settings: settings,
          page: SplashScreen(),
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
