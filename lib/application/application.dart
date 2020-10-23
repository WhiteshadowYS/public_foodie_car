import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:my_catalog/res/keys.dart';
import 'package:my_catalog/res/locales.dart';
import 'package:my_catalog/theme/custom_theme.dart';
import 'package:my_catalog/dictionary/flutter_delegate.dart';
import 'package:my_catalog/store/application/app_state.dart';
import 'package:my_catalog/ui/shared/splash_screen/splash_screen.dart';
import 'package:my_catalog/services/route_service/route_builder.dart' as route;
import 'package:my_catalog/store/shared/initialization/initialize_selector.dart';

// TODO(Yuri): Add comment for this class.
/// The [Application] class, in which the creation of [MaterialApp] takes place.
/// It takes [store] as a parameter, which is initialized in [main].
/// As [key], we set the string, "Application", which is inside [ApplicationKeys].
class Application extends StatelessWidget {
  final Store<AppState> store;

  Application({this.store}) : super(key: Key(ApplicationKeys.application));

  /// Here he connects to [StoreProvider], so that the application has one [store].
  /// In the [navigatorKey] option, we will write [NavigatorHolder] to NavigateToAction.
  /// Also, all rootes are connected here, in [onGenerateRoute].
  /// Also here is installed, the standard [locale], which can change in the course of the application.
  /// In [supportedLocales], we specify which languages will be used by the application.
  /// In [localizationsDelegates], we connect delegates.
  /// In the [builder] function, we specify the [textScaleFactor] that will be used throughout the application.
  /// After initialization, we will move to [SplashScreen].
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        onInitialBuild: (AppState state) => InitializeSelectors.startInitialization(store),
        builder: (BuildContext context, AppState store) {
          return MaterialApp(
            theme: ThemeData(
              splashColor: CustomTheme.colors.primaryColor.withOpacity(0.3),
              highlightColor: CustomTheme.colors.primaryColor.withOpacity(0.2),
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorHolder.navigatorKey,
            onGenerateRoute: route.RouteBuilder.onGenerateRoute,
            home: SplashScreen(),
            locale: Locale(Locales.base),
            supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
            localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
