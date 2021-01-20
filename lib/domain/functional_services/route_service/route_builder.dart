import 'package:foodie_client_template/domain/functional_services/route_service/models/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_client_template/ui/pages/about_page/about_page.dart';
import 'package:foodie_client_template/ui/pages/busket_page/busket_page.dart';
import 'package:foodie_client_template/ui/pages/categories_page/categories_page.dart';
import 'package:foodie_client_template/ui/pages/gallery_page/gallery_page.dart';
import 'package:foodie_client_template/ui/pages/home_page/home_page.dart';
import 'package:foodie_client_template/ui/pages/product_page/product_page.dart';
import 'package:foodie_client_template/ui/pages/products_page/products_page.dart';
import 'package:foodie_client_template/ui/pages/profile_page/profile_page.dart';
import 'package:foodie_client_template/ui/widgets/splash_screen.dart';
import 'package:foodie_client_template/ui/widgets/unknown_page.dart';

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

      case Routes.profile_page:
        return _defaultRoute(
          settings: settings,
          page: ProfilePage(),
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
      case Routes.busket_page:
        return _defaultRoute(
          settings: settings,
          page: BusketPage(),
        );
      case Routes.gallery_page:
        return _defaultRoute(
          settings: settings,
          page: GalleryPage(),
        );
      case Routes.product_page:
        return _defaultRoute(
          settings: settings,
          page: ProductPage(),
        );
      case Routes.products_page:
        return _defaultRoute(
          settings: settings,
          page: ProductsPage(),
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
