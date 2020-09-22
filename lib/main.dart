import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:pictures_view/application/application.dart';
import 'package:pictures_view/store/application/app_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  final Store<AppState> store = Store<AppState>(
    AppState.getReducer,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware<dynamic>(AppState.getAppEpic),
      NavigationMiddleware<AppState>(),
    ],
  );

  runApp(Application(store: store));
}
