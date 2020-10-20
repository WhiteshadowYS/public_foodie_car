import 'package:flutter/material.dart';

import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/route_service/models/routes.dart';
import 'package:my_catalog/ui/pages/catalogs_page/catalogs_page.dart';
import 'package:my_catalog/ui/pages/categories_page/categories_page.dart';
import 'package:my_catalog/ui/pages/main_page/main_page.dart';
import 'package:my_catalog/ui/pages/products_page/products_page.dart';
import 'package:my_catalog/ui/pages/settings_page/settings_page.dart';
import 'package:my_catalog/ui/pages/single_product_page/single_product_page.dart';
import 'package:my_catalog/ui/pages/subcategories_page/subcategories_page.dart';
import 'package:my_catalog/ui/pages/terms_page/terms_page.dart';
import 'package:my_catalog/ui/shared/splash_screen/splash_screen.dart';
import 'package:my_catalog/ui/shared/unknown_page/unknown_page.dart';

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

      case Routes.terms:
        return _defaultRoute(
          settings: settings,
          page: TermsPage(isReadOnly: false),
        );

      case Routes.termsReadOnly:
        return _defaultRoute(
          settings: settings,
          page: TermsPage(isReadOnly: true),
        );

      case Routes.settings:
        return _defaultRoute(
          settings: settings,
          page: SettingsPage(),
        );

      case Routes.products:
        return _defaultRoute(
          settings: settings,
          page: ProductsPage(),
        );

      case Routes.singleProduct:
        return _defaultRoute(
          settings: settings,
          page: SingleProductPage(),
        );

      case Routes.catalogs:
        return _defaultRoute(
          settings: settings,
          page: CatalogsPage(),
        );

      case Routes.categories:
        return _defaultRoute(
          settings: settings,
          page: CategoriesPage(),
        );

      case Routes.subCategories:
        return _defaultRoute(
          settings: settings,
          page: SubcategoriesPage(),
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
