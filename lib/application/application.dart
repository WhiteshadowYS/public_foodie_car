import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:pictures_view/res/const.dart';

import 'package:pictures_view/helpers/route_helper.dart';

import 'package:pictures_view/dictionary/flutter_delegate.dart';

import 'package:pictures_view/store/application/app_state.dart';

import 'package:pictures_view/ui/pages/home_page/home_page.dart';

class Application extends StatelessWidget {
  final Store<AppState> store;

  const Application({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateTitle: createTitle,
        navigatorKey: NavigatorHolder.navigatorKey,
        onGenerateRoute: RouteHelper.onGenerateRoute,
        home: HomePage(),
        locale: Locale(BASE_LOCALE),
        supportedLocales: FlutterDictionaryDelegate.getSupportedLocales,
        localizationsDelegates: FlutterDictionaryDelegate.getLocalizationDelegates,
      ),
    );
  }

  String createTitle (BuildContext context) {
    return 'Pictures';
  }
}