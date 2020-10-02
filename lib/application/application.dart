import 'package:flutter/material.dart';
import 'package:my_catalog/res/locales.dart';
import 'package:my_catalog/store/shared/initialization/initialize_selector.dart';
import 'package:my_catalog/ui/shared/splash_screen/splash_screen.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:my_catalog/services/route_service/route_builder.dart' as route;

import 'package:my_catalog/res/const.dart';

import 'package:my_catalog/dictionary/flutter_delegate.dart';

import 'package:my_catalog/store/application/app_state.dart';

class Application extends StatelessWidget {
  final Store<AppState> store;

  Application({this.store}) : super(key: Key('Application'));

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        onInitialBuild: (AppState state) => InitializeSelectors.startInitialization(store),
        builder: (BuildContext context, AppState store) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigatorHolder.navigatorKey,
            onGenerateRoute: route.RouteBuilder.onGenerateRoute,
            home: SplashScreen(),
            locale: Locale(Locales.base),
            supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
            localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
          );
        },
      ),
    );
  }
}
