import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:my_catalog/application/application.dart';
import 'package:my_catalog/store/application/app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final Store store = Store<AppState>(
    AppState.getReducer,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware(AppState.getAppEpic),
      NavigationMiddleware<AppState>(),
    ],
  );

  runApp(Application(store: store));
}
